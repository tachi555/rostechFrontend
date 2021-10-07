import { Component, OnInit } from '@angular/core';
import { Meta } from '@angular/platform-browser';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  title = 'Home';

  constructor(private meta: Meta) {
    this.meta.addTags([
      { name: 'Jasa', content: 'Tekuk Plat' },
      { name: 'Jasa', content: 'Potong Plat' },
      { name: 'Pembuatan', content: 'Mesin UMKM' },
      { name: 'Pemotongan', content: 'CNC Plasma' }
    ], true);
   }

  ngOnInit(): void {
  }

  downloadMyFile(){
    const link = document.createElement('a');
    link.setAttribute('target', '_blank');
    link.setAttribute('href', 'assets/Brosur CNC Plasma.pdf');
    link.setAttribute('download', `Brosur CNC Plasma.pdf`);
    document.body.appendChild(link);
    link.click();
    link.remove();
  }

  scroll(el: HTMLElement) {
    el.scrollIntoView();
  }

}
