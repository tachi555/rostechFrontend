import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActuallyapageComponent } from './actuallyapage.component';

describe('ActuallyapageComponent', () => {
  let component: ActuallyapageComponent;
  let fixture: ComponentFixture<ActuallyapageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ActuallyapageComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ActuallyapageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
