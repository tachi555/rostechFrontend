import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TokoComponent } from './toko.component';

describe('TokoComponent', () => {
  let component: TokoComponent;
  let fixture: ComponentFixture<TokoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TokoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TokoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
