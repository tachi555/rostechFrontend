import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { LocalStorageService, SessionStorageService, LocalStorage, SessionStorage } from 'angular-web-storage';
import { Router } from '@angular/router';


@Injectable({
  providedIn: 'root'
})
export class GuardLoginGuard implements CanActivate {
  @SessionStorage() sessionValue: string = `Hello ${+new Date}`;
  @SessionStorage() loginValue: boolean = true;

  constructor(private router : Router) { }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    
    // return  "1"==sessionStorage.getItem("lValue");
    return true;
  }
  
}
