import { Component, OnInit } from '@angular/core';
import { DbServiceService } from '../db-service.service';
import { Router } from '@angular/router';
import { Toko } from '../Model/Toko';
import {MessageService} from 'primeng/api';

@Component({
  selector: 'app-toko',
  templateUrl: './toko.component.html',
  styleUrls: ['./toko.component.scss'],
  providers: [MessageService]
})
export class TokoComponent implements OnInit {
  collectionSize = 0;
  page = 1;
  pageSize = 15;
  pageShow : any;
  listHasil : Array<Toko> = new Array();
  first = 0;
  rows = 10;

  toko : Toko = new Toko();
  nama : String = "";
  type : String = "";
  ukuran : String = "";
  tanggal : Date = new Date();
  jumlah : Number = 0;
  total : Number = 0;
  ket : String = "";
  id : any;
  loading = false;
  lHidden = false;
  lDupe : boolean = false;

  constructor(private router : Router, private dbService : DbServiceService, private messageService: MessageService) { }

  ngOnInit(): void {
    this.loading = true;
    this.toko.id = 0;
    this.getHasilGet();
    this.loading = false;
  }
  
  getHasilGet()  
  {  
    this.dbService.getHasilToko().subscribe((res:any)=>{ 
      console.log(res);
      this.listHasil=res;
      this.collectionSize=res.length
      this.loading = false;
    });  

  }

  edit(hasil : Toko){
    this.toko.id = hasil.id;
    this.toko.nama = hasil.nama;
    this.toko.contact = hasil.contact;
    this.toko.telpon = hasil.telpon;
    this.toko.alamat = hasil.alamat;
    this.toko.ket = hasil.ket;
  }

  insertMaterial(){
    this.loading = true;
    if("" != this.toko.nama){
      this.dbService.insertToko(this.toko).subscribe((res:any)=>{ 
        console.log(res);
        if(res == -1){
          this.lDupe = true;
          this.lHidden = false;
        } else {
          this.lDupe = false;
          this.lHidden = false;
          this.id=res;
          this.toko = new Toko();
          this.toko.id = 0
          this.loading = false;
          this.getHasilGet();
          this.toko.id = 0;
          this.toko.nama = "";
          this.toko.contact = "";
          this.toko.telpon = "";
          this.toko.alamat = "";
          this.toko.ket = ""   
          this.messageService.add({key: 'toast', severity:'success', summary: 'Success', detail: 'Save success'});
          this.loading = false;
        }
      });  
    } else {
      this.lDupe = false;
      this.lHidden = true;
    }
    this.loading = false;
  }

  next() {
      this.first = this.first + this.rows;
  }

  prev() {
      this.first = this.first - this.rows;
  }

  reset() {
      this.first = 0;
  }

  isLastPage(): boolean {
      return this.listHasil ? this.first === (this.listHasil.length - this.rows): true;
  }

  isFirstPage(): boolean {
      return this.listHasil ? this.first === 0 : true;
  }

}
