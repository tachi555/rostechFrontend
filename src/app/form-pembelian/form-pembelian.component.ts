import { Component, OnInit, Directive, EventEmitter, Input, Output, QueryList, ViewChildren } from '@angular/core';
import { DbServiceService } from '../db-service.service';
import { Router } from '@angular/router';
import { Toko } from '../Model/Toko';
import { Pembelian } from '../Model/Pembelian';
import { Material } from '../Model/Material';
import {MessageService} from 'primeng/api';

@Component({
  selector: 'app-form-pembelian',
  templateUrl: './form-pembelian.component.html',
  styleUrls: ['./form-pembelian.component.scss'],
  providers: [MessageService]
})
export class FormPembelianComponent implements OnInit {
  listToko : Array<Toko> = new Array();
  listMaterial : Array<Material> = new Array();;
  tid : any = -1;
  mid : any = -1;
  tnama : String = "";
  mnama : String = "";
  pembelian : Pembelian = new Pembelian();
  listAuto : String[] = new Array();
  selectedAuto : string = '';
  listAutoToko : String[] = new Array();
  selectedAutoToko : string = '';
  lastPrice : any;
  lastDate : any;

  listHasil : Array<Pembelian> = new Array();
  first = 0;
  rows = 10;
  collectionSize = 0;
  page = 1;
  pageSize = 15;
  pageShow : any;
  id : any;
  lHidden : boolean = false;
  loading : boolean = false;


  constructor(private router : Router, private dbService : DbServiceService, private messageService: MessageService) { }
  

  ngOnInit(): void {
    this.pembelian.tanggal = new Date();
    this.pembelian.id = 0;

    this.dbService.getAutoMaterial('').subscribe((res:any)=>{ 
      console.log(res);
      if(res.length>0){
        this.listAuto=res;
      }
    });

    this.dbService.getAutoToko('').subscribe((res:any)=>{ 
      console.log(res);
      if(res.length>0){
        this.listAutoToko=res;
      }
    });
    
    // this.dbService.getComboToko(this.tnama).subscribe((res:any)=>{ 
    //   console.log(res);
    //   if(res.length>0){
    //     this.listToko=res;
    //     this.pembelian.tid = res[0].id
    //   }
    // });  

    // this.dbService.getComboMaterial(this.mnama).subscribe((res:any)=>{ 
    //   console.log(res);
    //   if(res.length>0){
    //     this.listMaterial=res;
    //     this.pembelian.mid = res[0].mid
    //   }
    // });  

    this.dbService.getHasilPembelian().subscribe((res:any)=>{ 
      console.log(res);

      this.listHasil = res;
      this.collectionSize = res.length
    });  
  }

  search(event : Event){
    this.dbService.getAutoMaterial(this.selectedAuto).subscribe((res:any)=>{ 
      console.log(res);
      if(res.length>0){
        this.listAuto=res;
      }
    });
  }

  getMid(){
    this.pembelian.mid = this.selectedAuto.split(' ',1)[0];
    this.dbService.getLastPrice(this.pembelian.mid).subscribe((res:any)=>{ 
      console.log(res);
      this.lastPrice = res.persatuan;
      this.lastDate = res.tanggal;
    });
  }

  searchToko(event : Event){
    this.dbService.getAutoToko(this.selectedAutoToko).subscribe((res:any)=>{ 
      console.log(res);
      if(res.length>0){
        this.listAutoToko=res;
      }
    });
  }

  getTid(){
    this.pembelian.tid = this.selectedAutoToko.split(' ',1)[0];
  }

  insertPembelian(){
    if(this.pembelian.tid != "" && this.pembelian.mid != "" && this.pembelian.persatuan != 0 && this.pembelian.jumlah != 0 && this.pembelian.total != 0 
      && new Date() != this.pembelian.tanggal){
      this.loading= true;
      if(null == this.pembelian.ket || this.pembelian.ket.length <= 0){
        this.pembelian.ket = "";
      }
      this.pembelian.tanggal = new Date(this.pembelian.tanggal);
      
      this.dbService.inputPembelian(this.pembelian).subscribe((res:any)=>{ 
        console.log(res);
        this.id=res;

        this.dbService.getHasilPembelian().subscribe((res:any)=>{ 
          console.log(res);
    
          this.listHasil = res;
          this.collectionSize = res.length
        });

        this.pembelian.persatuan = 0;
        this.pembelian.jumlah = 0;
        this.pembelian.total = 0;
        this.pembelian.id = 0;
        this.pembelian.ket = '';
        this.messageService.add({key: 'toast', severity:'success', summary: 'Success', detail: 'Save success'});
        this.loading = false;
      }); 
    } else {
      this.lHidden = true;
    }
    this.loading = false
  }

  editPembelian(hasil : Pembelian ){
    this.pembelian.id = hasil.id;
    this.pembelian.mid = hasil.mid;
    this.pembelian.tid = hasil.tid;
    this.pembelian.persatuan = hasil.persatuan;
    this.pembelian.jumlah = hasil.jumlah;
    this.pembelian.total = hasil.total;
    this.pembelian.tanggal = hasil.tanggal;
    this.pembelian.ket = hasil.ket;
  }

  hitungTotal(){
    this.pembelian.total = this.pembelian.persatuan * this.pembelian.jumlah;
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
