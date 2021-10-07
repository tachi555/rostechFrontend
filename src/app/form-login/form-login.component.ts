import { Component, OnInit } from '@angular/core';
import { DbServiceService } from '../db-service.service';
import { Router } from '@angular/router';
import {Md5} from 'ts-md5/dist/md5';
import { Iip } from '../Model/Iip';
import { finalize } from 'rxjs/operators';


@Component({
  selector: 'app-form-login',
  templateUrl: './form-login.component.html',
  styleUrls: ['./form-login.component.scss']
})
export class FormLoginComponent implements OnInit {

  uname : string = "";
  pass : string = "";
  ipAddress : string = "";
  isi : any = "";
  lHidden : boolean = false;
  attr : any;
  hasilPost : any;
  loading : boolean = false;
  passmd5 : string = "";
  role : any;

  constructor(private router : Router, private dbService : DbServiceService) { 
   
  }

  ngOnInit(): void {
    window.sessionStorage.setItem("lValue","");
    window.sessionStorage.setItem("uname","");
    window.sessionStorage.setItem("pass","");
    window.sessionStorage.setItem("uip","");
    window.sessionStorage.setItem("isi","");
    window.sessionStorage.setItem("hasilPost","");
    window.sessionStorage.setItem("role","");

    this.getIP();
    //  sessionStorage.setItem("loginValue", "false");
  }  

  login(){
    this.loading = true;
    this.doLogin();

    // if(null != this.uname && "" != this.uname && null != this.pass && "" != this.pass){
    //   this.doLogin();
      
    //   this.loading = false;
    // } else {
    //   this.loading = false;
    //   this.lHidden = true;
    // }
  }

  doLogin() {
    const md5 = new Md5();
    this.passmd5 = md5.appendStr(this.pass).end().toString();

    // this.dbService.login(this.ipAddress, this.uname, this.passmd5).pipe().subscribe(
    this.dbService.login(this.ipAddress, 'itest', 'fec2b8ace11d2e8115a9cb8ed56f6ec8').pipe().subscribe(
        res => {
          this.hasilPost = res;
          this.doForm()
        });
  }

  doForm(){
    window.sessionStorage.setItem("uname", this.uname);
    window.sessionStorage.setItem("uip", this.ipAddress);
    window.sessionStorage.setItem("lValue", "1");
    window.sessionStorage.setItem("hasilPost", this.hasilPost);
    window.localStorage.setItem("hasilPost", this.hasilPost);
    
    this.isi = this.hasilPost[0].token;
    this.role = this.hasilPost[0].role;
    window.sessionStorage.setItem("isi", this.isi);
    window.sessionStorage.setItem("role", this.role);

    if(this.hasilPost[0].token != undefined && this.hasilPost[0].token != null && this.hasilPost[0].token != "22"){
      this.router.navigate(["./do-form"]);
    }
  }

  getName(){
    this.getName
  }

  getIP()  
  {  
    this.ipAddress='127.0.0.1';
    // this.dbService.getIp().subscribe((res:any)=>{ 
    //   this.ipAddress=res.ip
    // }, 
    // error => {},
    // () => {});  
  }

}
