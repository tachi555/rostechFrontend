import { Component, ViewChild, ElementRef } from '@angular/core';
import { PrimeNGConfig } from 'primeng/api';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
  // styleUrls: ['node_modules/primeng/primeng/resources/themes/bootstrap4-light-blue/theme.css']
})

export class AppComponent {
  title = 'ROSTECH - Jasa Pembuatan Mesin UMKM, Pemotongan CNC Plasma Cutting dan Tekuk Plat & Potong Plat';
  
  constructor(private primengConfig: PrimeNGConfig) {}

  ngOnInit() {
    this.primengConfig.ripple = true;
  }

  scroll(el: HTMLElement) {
    el.scrollIntoView();
  }

}
