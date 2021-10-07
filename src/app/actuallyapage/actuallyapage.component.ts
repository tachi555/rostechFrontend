import { Component, OnInit, AfterViewInit, Renderer2, ViewChild, ElementRef, ContentChild } from '@angular/core';


@Component({
  selector: 'app-actuallyapage',
  templateUrl: './actuallyapage.component.html',
  styleUrls: ['./actuallyapage.component.scss']
})
  
export class ActuallyapageComponent implements OnInit {

  height : string = '100';
  width : string = '100';

  constructor(private rd: Renderer2, private element: ElementRef) { }

  ngOnInit(): void {
  }

  generate(){
    // const board = document.getElementById("board");
    console.log('click');
    var board = <HTMLElement>document.querySelector('#board');
    board.style.width = '100';

  }

}
