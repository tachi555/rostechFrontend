import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AngularWebStorageModule  } from 'angular-web-storage';
import { HttpClientModule  } from '@angular/common/http';
import {FormsModule} from '@angular/forms';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HomeComponent } from './home/home.component';
import { ActuallyapageComponent } from './actuallyapage/actuallyapage.component';
import { MaterialPageComponent } from './material-page/material-page.component';
import { FormLoginComponent } from './form-login/form-login.component';
import { FormMaterialComponent } from './form-material/form-material.component';
import { FormModeComponent } from './form-mode/form-mode.component';
import { RouterModule } from '@angular/router';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DropdownModule } from 'primeng/dropdown';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { TokoComponent } from './toko/toko.component';
import { CalendarModule } from 'primeng/calendar';
import { FormPembelianComponent } from './form-pembelian/form-pembelian.component';
import { FormStockComponent } from './form-stock/form-stock.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ReactiveFormsModule } from '@angular/forms';
import { FormHistoryComponent } from './form-history/form-history.component';
import {CarouselModule} from 'primeng/carousel';
import {ToastModule} from 'primeng/toast';
import { FormHistoryStockComponent } from './form-history-stock/form-history-stock.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ActuallyapageComponent,
    MaterialPageComponent,
    FormLoginComponent,
    FormMaterialComponent,
    FormModeComponent,
    TokoComponent,
    FormPembelianComponent,
    FormStockComponent,
    FormHistoryComponent,
    FormHistoryStockComponent

  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'serverApp' }),
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    AngularWebStorageModule,
    RouterModule,
    FormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    DropdownModule,
    BrowserAnimationsModule,
    CalendarModule,
    ReactiveFormsModule,
    AutoCompleteModule,
    CarouselModule,
    ToastModule
    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
