import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { DbServiceService } from '../db-service.service';
import { Ilogin } from '../Model/Ilogin';
import { Iip } from '../Model/Iip';

@Component({
  selector: 'app-form-mode',
  templateUrl: './form-mode.component.html',
  styleUrls: ['./form-mode.component.scss']
})
export class FormModeComponent implements OnInit {

  value : any;
  uname : any;
  uip : any;
  hasilPost : any;
  token : String = "";
  isi : any;
  loading : boolean = false;
  ip : any;
  infoShow : boolean = false;
  role : any;
  fromApi : any;

  constructor(private router : Router, private dbService : DbServiceService) { }

  ngOnInit(): void {
    // this.loading = true;
    this.value = window.sessionStorage.getItem("lValue");
    this.uname = window.sessionStorage.getItem("uname");
    this.uip = window.sessionStorage.getItem("uip");
    this.hasilPost = window.sessionStorage.getItem("hasilPost");
    this.role = window.sessionStorage.getItem("role");
    this.isi = window.sessionStorage.getItem("isi");

    // this.token = this.isi;

    // if(this.isi.length == 0) {
    //   this.router.navigate(["./do-login"]);
    // } else {
    //   this.getIP();

    //   let iip : Iip = new Iip();

    //   this.dbService.stillLogin(this.ip).subscribe((res:any)=>{ 
    //     iip=res;
    //     this.fromApi=res;

    //     if(this.isi != res.token || res.token.length <= 0){
    //       this.loading = false;
    //       this.router.navigate(["./do-login"])
    //     }
    //   },error => this.router.navigate(["./do-login"]),
    //   );  
    // }

    this.getIP();

    this.dbService.checkStillLogin(this.ip, this.isi);  
    

    // if(null == this.token || this.token == "22"){
    //   window.location.assign("./do-login")
    // }
    // this.loading = false;
  }

  getSession(key : string){
    return sessionStorage.getItem(key)?sessionStorage.getItem(key)?.toString:"";
  }

  logout(){
    this.dbService.logout().subscribe((res:any)=>{ 
      window.sessionStorage.setItem("lValue","");
      window.sessionStorage.setItem("uname","");
      window.sessionStorage.setItem("uip","");
      window.sessionStorage.setItem("isi","");
      window.sessionStorage.setItem("hasilPost","");
      window.sessionStorage.setItem("role","");
      this.router.navigate(["./do-login"]);
    }); 
  }

  clearStorage(){
    window.sessionStorage.setItem("lValue","");
    window.sessionStorage.setItem("uname","");
    window.sessionStorage.setItem("uip","");
    window.sessionStorage.setItem("isi","");
    window.sessionStorage.setItem("hasilPost","");
    window.sessionStorage.setItem("role","");
  }

  getIP()  
  {  
    this.ip='127.0.0.1';
    // this.dbService.getIp().subscribe((res:any)=>{ 
    //   this.ip=res.ip

    //   // if(this.ip != this.uip){
    //   //   window.location.assign("./do-login")
    //   //   this.loading = false;
    //   // }
    // }, 
    // error => {this.router.navigate(["./do-login"])},
    // () => {});  
  }

  info(){
    this.infoShow = !this.infoShow;
  }

}
