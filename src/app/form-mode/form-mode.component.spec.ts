import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormModeComponent } from './form-mode.component';

describe('FormModeComponent', () => {
  let component: FormModeComponent;
  let fixture: ComponentFixture<FormModeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormModeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormModeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
