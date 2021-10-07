import { Component, OnInit } from '@angular/core';
import { DbServiceService } from '../db-service.service';
import { Router } from '@angular/router';
import { Material } from '../Model/Material';
import { Stock } from '../Model/Stock';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import {MessageService} from 'primeng/api';

@Component({
  selector: 'app-form-stock',
  templateUrl: './form-stock.component.html',
  styleUrls: ['./form-stock.component.scss'],
  providers: [MessageService]
})
export class FormStockComponent implements OnInit {
  collectionSize = 0;
  collectionSizeHistory = 0;
  page = 1;
  pageSize = 15;
  pageHistory = 1;
  pageSizeHistory = 15;
  pageShow : any;
  pageShowHistory : any;
  loading : boolean = false;
  lHidden : boolean = false;

  tnama : String = "";
  mnama : String = "";
  listAuto : String[] = new Array();
  selectedAuto : string = '';
  
  id : any;
  stock : Stock = new Stock();
  listHasil : Array<Stock> = new Array();
  listMaterial : Array<Material> = new Array();
  showStock : any;
  listHasil2 : Array<Stock> = new Array();
  first = 0;
  rows = 10;
  first2 = 0;
  rows2 = 10;

  // stockForm = new FormGroup({
  //     perubahan : new FormControl(null,Validators.required),
  //     // total : new FormControl(null,Validators.required),
  //     tanggal : new FormControl(null,Validators.required),
  //     ket : new FormControl('')
  // });

  constructor(private router : Router, private dbService : DbServiceService, private messageService: MessageService) { }

  ngOnInit(): void {

    this.dbService.getAutoMaterial('').subscribe((res:any)=>{ 
      console.log(res);
      if(res.length>0){
        this.listAuto=res;
      }
    });

    // this.dbService.getComboMaterial(this.mnama).subscribe((res:any)=>{ 
    //   console.log(res);
    //   if(res.length>0){
    //     this.listMaterial=res;
    //     this.stock.mid = res[0].mid
    //   }
    // }); 

    this.dbService.getHasilStock().subscribe((res:any)=>{ 
      console.log(res);
      this.listHasil=res;
      this.collectionSize=res.length
    }); 

    this.dbService.getStockHistoryList().subscribe((res:any)=>{ 
      console.log(res);
      this.listHasil2=res;
      this.collectionSizeHistory=res.length
    }); 
  }

  insertStock(){
    if("" != this.stock.mid && "" != this.stock.perubahan){
      this.loading = true;
      this.dbService.insertStock(this.stock).subscribe((res:any)=>{ 
        console.log(res);
        this.id=res;
        this.messageService.add({key: 'toast', severity:'success', summary: 'Success', detail: 'Save success'});
        this.loading = false;
        window.location.reload()
      });  
    } else {
      this.lHidden = true;
    }
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
    this.stock.mid = this.selectedAuto.split(' ',1)[0];
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

  next2() {
      this.first = this.first + this.rows;
  }

  prev2() {
      this.first = this.first - this.rows;
  }

  reset2() {
      this.first = 0;
  }

  isLastPage2(): boolean {
      return this.listHasil ? this.first === (this.listHasil.length - this.rows): true;
  }

  isFirstPage2(): boolean {
      return this.listHasil ? this.first === 0 : true;
  }

}
