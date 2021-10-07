import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { from, Observable, of, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { Material } from './Model/Material';
import { Iip } from './Model/Iip';
import { Ilogin } from './Model/Ilogin';
import { Toko } from './Model/Toko';
import { Pembelian } from './Model/Pembelian';
import { Stock } from './Model/Stock';


@Injectable({
  providedIn: 'root'
})
export class DbServiceService {

  // url : String = "http://localhost:8080/api/"; // server tomcat

  url : String = "http://localhost:8080/"; // build server

  constructor(private router : Router, private http : HttpClient) { }
  
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type':  'application/xml',
      'Authorization': 'jwt-token'
    })
  };

  login(ipAddress : string, uname : string, pass : string){

    if(""!=ipAddress && ""!=uname && ""!=pass){
      sessionStorage.setItem("loginValue", "1");
      sessionStorage.setItem("clientIp", ipAddress);
      // return null!=ipAddress && ""!=ipAddress;

      let ilogin : Ilogin = new Ilogin();
      ilogin.nama = uname;
      ilogin.pass = pass;
      ilogin.notes = ipAddress;

      const headers = { 'content-type': 'application/json'}  
      const body=JSON.stringify(ilogin);
      
      return this.http.post(this.url+"doLogin", body, {'headers':headers}).pipe(
        retry(3), 
        catchError(this.handleError)
      );

    } else {
      return new Observable<string>(observer =>{
        observer.next("0");
      })
    }
  }

  logout(){

    let ilogin : Ilogin = new Ilogin();
    ilogin.notes = window.sessionStorage.getItem("uip");

    const headers = { 'content-type': 'application/json'}  
    const body=JSON.stringify(ilogin);
    
    return this.http.post(this.url+"doLogout", body, {'headers':headers}).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  stillLogin(ipAddress : string){

    if(""!=ipAddress){

      let token = sessionStorage.getItem("isi");
      let iip : Iip = new Iip();
      iip.ip = ipAddress;
      iip.token = token;

      const headers = { 'content-type': 'application/json'}  
      const body=JSON.stringify(iip);
      
      return this.http.post(this.url+"stillLogin", body, {'headers':headers}).pipe(
        retry(3), 
        catchError(this.handleError)
      );

    } else {
      return new Observable<string>(observer =>{
        observer.next("0");
      })
    }
  }

  checkStillLogin(ipAddress : string, token : string){

    this.stillLogin(ipAddress).subscribe((res:any)=>{

      console.log(res)
  
      if(undefined == res || undefined == res.token){
        this.router.navigate(["./do-login"])
      } else if(token != res.token){
        this.router.navigate(["./do-login"])
      }
      return new Observable<number>(observer =>{
        observer.next(0);
      });
    }
    );
  }

  getIp(){
    return this.http.get("http://api.ipify.org/?format=json");
  }

  handleError(error: HttpErrorResponse) {
    let errorMessage = 'Unknown error!';
    if (error.error instanceof ErrorEvent) {
      // Client-side errors
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side errors
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    window.alert(errorMessage);
    return throwError(errorMessage);
  }

  insertMaterial(material : Material) {
    let ip = sessionStorage.getItem("clientIp");
    let token = sessionStorage.getItem("isi");
    material.ip = ip;
    material.token = token;

    if(material.mid == 0){
      return this.http.post(this.url+"insertmaterial", material).pipe(
        retry(3), 
        catchError(this.handleError)
      );
    } else {
      return this.http.post(this.url+"editMaterial", material).pipe(
        retry(3), 
        catchError(this.handleError)
      );
    }
  }

  getHasilGet() {
    let ip = sessionStorage.getItem("clientIp");
    let token = sessionStorage.getItem("isi");
    let material : Material = new Material();
    material.ip = ip;
    material.token = token;
    
    return this.http.post(this.url+"listmaterial", material).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getLastPrice(mid : any) {
    let ip = sessionStorage.getItem("clientIp");
    let token = sessionStorage.getItem("isi");
    let material : Material = new Material();
    material.ip = ip;
    material.token = token;
    material.mid = mid;

    return this.http.post(this.url+"getLastPrice", material).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getComboMaterial(nama : String) {
    let ip = sessionStorage.getItem("clientIp");
    let token = sessionStorage.getItem("isi");
    let material : Material = new Material();
    material.ip = ip;
    material.token = token;
    material.nama = nama;

    return this.http.post(this.url+"getComboMaterial", material).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getAutoMaterial(nama : string) {
    let ip = sessionStorage.getItem("clientIp");
    let token = sessionStorage.getItem("isi");
    let material : Material = new Material();
    material.ip = ip;
    material.token = token;
    material.nama = nama;

    return this.http.post(this.url+"getAutoMaterial", material).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  insertToko(toko : Toko) {
    toko.ip = sessionStorage.getItem("clientIp");
    toko.token = sessionStorage.getItem("isi");
    
    if(toko.id == 0){
      return this.http.post(this.url+"insertToko", toko).pipe(
        retry(3), 
        catchError(this.handleError)
      );

    } else {
      return this.http.post(this.url+"editToko", toko).pipe(
        retry(3), 
        catchError(this.handleError)
      );
    }
  }

  getHasilToko() {
    let toko : Toko = new Toko();
    toko.ip = sessionStorage.getItem("clientIp");
    toko.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"listToko", toko).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getComboToko(nama : String) {
    let toko : Toko = new Toko();
    toko.ip = sessionStorage.getItem("clientIp");
    toko.token = sessionStorage.getItem("isi");
    toko.nama = nama;

    return this.http.post(this.url+"getComboToko", toko).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getAutoToko(nama : string) {
    let toko : Toko = new Toko();
    toko.ip = sessionStorage.getItem("clientIp");
    toko.token = sessionStorage.getItem("isi");
    toko.nama = nama;

    return this.http.post(this.url+"getAutoToko", toko).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getHasilPembelian() {
    let pembelian : Pembelian = new Pembelian();
    pembelian.ip = sessionStorage.getItem("clientIp");
    pembelian.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"getHarga", pembelian).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getHasilPembelianByMaterialId(pembelian : Pembelian) {
    pembelian.ip = sessionStorage.getItem("clientIp");
    pembelian.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"getHargaByMaterialId", pembelian).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  inputPembelian(pembelian : Pembelian) {
    pembelian.ip = sessionStorage.getItem("clientIp");
    pembelian.token = sessionStorage.getItem("isi");
    
    if(pembelian.id == 0){
      return this.http.post(this.url+"inputPembelian", pembelian).pipe(
        retry(3), 
        catchError(this.handleError)
      );
      
    } else {
      pembelian.ket = "Edit pembelian id " + pembelian.id + " pada " +new Date() + "\n" +pembelian.ket;
      return this.http.post(this.url+"editPembelian", pembelian).pipe(
        retry(3), 
        catchError(this.handleError)
      );
    }
  }

  insertStock(stock : Stock) {
    stock.ip = sessionStorage.getItem("clientIp");
    stock.token = sessionStorage.getItem("isi");
    
    return this.http.post(this.url+"insertStock", stock).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getHasilStock() {
    let stock : Stock = new Stock();
    stock.ip = sessionStorage.getItem("clientIp");
    stock.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"getStock", stock).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getStockHistoryList() {
    let stock : Stock = new Stock();
    stock.ip = sessionStorage.getItem("clientIp");
    stock.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"getStockHistoryList", stock).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getHasilStockByMaterialId(stock : Stock) {
    stock.ip = sessionStorage.getItem("clientIp");
    stock.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"getStockByMaterialId", stock).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  getStockLatestStockById(stock : Stock) {
    stock.ip = sessionStorage.getItem("clientIp");
    stock.token = sessionStorage.getItem("isi");

    return this.http.post(this.url+"getStockLatestStockById", stock).pipe(
      retry(3), 
      catchError(this.handleError)
    );
  }

  // mariadb = require('mariadb');
  // pool = this.mariadb.createPool({host: process.env.DB_HOST, user: process.env.DB_USER, connectionLimit: 5});
  
  //  async checkLogin(uname : string) {
  //   let conn;
  //   try {
  
  //   conn = await this.pool.getConnection();
  //   const rows = await conn.query("SELECT checkLogin('" +uname +"'");
    
  //   return rows;
  
  //   } catch (err) {
  //   throw err;
  //   } finally {
  //   if (conn) conn.release(); //release to pool
  //   }
  // }
  

}

