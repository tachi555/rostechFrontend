import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormHistoryStockComponent } from './form-history-stock.component';

describe('FormHistoryStockComponent', () => {
  let component: FormHistoryStockComponent;
  let fixture: ComponentFixture<FormHistoryStockComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormHistoryStockComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormHistoryStockComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
