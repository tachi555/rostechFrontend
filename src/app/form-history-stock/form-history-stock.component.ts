import { Component, OnInit } from '@angular/core';
import { DbServiceService } from '../db-service.service';
import { Router } from '@angular/router';
import { Toko } from '../Model/Toko';
import { Stock } from '../Model/Stock';
import { Material } from '../Model/Material';

@Component({
  selector: 'app-form-history-stock',
  templateUrl: './form-history-stock.component.html',
  styleUrls: ['./form-history-stock.component.scss']
})
export class FormHistoryStockComponent implements OnInit {
  listToko : Array<Toko> = new Array();
  listMaterial : Array<Material> = new Array();;
  tid : any = -1;
  mid : any = -1;
  tnama : String = "";
  mnama : String = "";
  stock : Stock = new Stock();
  listAuto : String[] = new Array();
  selectedAuto : string = '';

  listHasil : Array<Stock> = new Array();
  first = 0;
  rows = 10;
  collectionSize = 0;
  page = 1;
  pageSize = 15;
  pageShow : any;
  id : any;
  lHidden : boolean = false;
  loading : boolean = false;

  constructor(private router : Router, private dbService : DbServiceService) { }
  

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

    this.dbService.getHasilStockByMaterialId(this.stock).subscribe((res:any)=>{ 
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
    this.stock.mid = this.selectedAuto.split(' ',1)[0];
  }

  refreshPembelian(){

    this.dbService.getHasilStockByMaterialId(this.stock).subscribe((res:any)=>{ 
      console.log(res);

      this.listHasil = res;
      this.collectionSize = res.length
    }); 
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
