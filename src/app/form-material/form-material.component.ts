import { Component, OnInit } from '@angular/core';
import { DbServiceService } from '../db-service.service';
import { Router } from '@angular/router';
import { Material } from '../Model/Material';
import {MessageService} from 'primeng/api';

@Component({
  selector: 'app-form-material',
  templateUrl: './form-material.component.html',
  styleUrls: ['./form-material.component.scss'],
  providers: [MessageService]
})
export class FormMaterialComponent implements OnInit {
  collectionSize = 0;
  page = 1;
  pageSize = 15;
  pageShow : any;
  material : Material = new Material();
  listHasil : Array<Material> = new Array();
  loading : boolean = false;
  lHidden : boolean = false;
  lDupe : boolean = false;
  first = 0;
  rows = 10;

  nama : String = "";
  type : String = "";
  ukuran : String = "";
  tanggal : Date = new Date();
  jumlah : Number = 0;
  total : Number = 0;
  ket : String = "";
  id : any;

  constructor(private router : Router, private dbService : DbServiceService, private messageService: MessageService) { }

  ngOnInit(): void {
    this.loading = true;
    this.material.mid = 0;

    this.getHasilGet();

    this.loading = false;
  }
  
  getHasilGet()  
  {  
    this.dbService.getHasilGet().subscribe((res:any)=>{ 
      console.log(res);
      this.listHasil=res;
      this.collectionSize=res.length
    });  

  }

  editMaterial(hasil : Material ){
    this.material.mid = hasil.mid;
    this.material.nama = hasil.nama;
    this.material.type = hasil.type;
    this.material.ukuran = hasil.ukuran;
    this.material.ket = hasil.ket;
  }

  insertMaterial(){
    if("" != this.material.nama){
      this.loading = true;
      this.dbService.insertMaterial(this.material).subscribe((res:any)=>{ 
        console.log(res);

        if(res == -1){
          this.lDupe = true;
          this.lHidden = false;
        } else {
          this.lDupe = false;
          this.lHidden = false;
          this.id=res;
          this.loading = false;
          // window.location.reload()
          this.getHasilGet()
          this.material = new Material()
          this.material.mid = 0;
          this.messageService.add({key: 'toast', severity:'success', summary: 'Success', detail: 'Save success'});
          this.loading = false;
        }
        res = res

        , this.loading =false , this.loading = false
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
