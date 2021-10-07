import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormPembelianComponent } from './form-pembelian.component';

describe('FormPembelianComponent', () => {
  let component: FormPembelianComponent;
  let fixture: ComponentFixture<FormPembelianComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormPembelianComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormPembelianComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
