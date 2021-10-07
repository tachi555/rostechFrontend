import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent} from './home/home.component';
import { GuardLoginGuard} from './guard-login.guard';
import { GuardChildLoginGuard} from './guard-child-login.guard';
import { FormLoginComponent} from './form-login/form-login.component';
import { FormModeComponent} from './form-mode/form-mode.component';
import { FormMaterialComponent} from './form-material/form-material.component';
import { TokoComponent } from './toko/toko.component';
import { FormPembelianComponent } from './form-pembelian/form-pembelian.component';
import { FormStockComponent } from './form-stock/form-stock.component';
import { FormHistoryComponent } from './form-history/form-history.component';
import { FormHistoryStockComponent } from './form-history-stock/form-history-stock.component';
import { HashLocationStrategy, LocationStrategy, PathLocationStrategy } from '@angular/common';
import { ActuallyapageComponent } from './actuallyapage/actuallyapage.component';

const routes: Routes = [
  { path: '', 
    component: HomeComponent,
    pathMatch: 'prefix'
  },
  { path: '#', component: HomeComponent },
  { path: 'home', redirectTo: '', pathMatch: 'prefix' },
  { path: 'mesin_umkm', redirectTo: '/?#mesin-umkm', pathMatch: 'full' },
  { path: 'mesin-umkm', redirectTo: '/?#mesin-umkm', pathMatch: 'prefix' },
  { path: 'plasma_cutting', redirectTo: '/?#plasma-cutting', pathMatch: 'prefix' },
  { path: 'plasma-cutting', redirectTo: '/?#plasma-cutting', pathMatch: 'prefix' },
  { path: 'tekuk_plat', redirectTo: '/?#tekuk-plat', pathMatch: 'prefix' },
  { path: 'tekuk-plat', redirectTo: '/?#tekuk-plat', pathMatch: 'prefix' },
  { path: 'potong_plat', redirectTo: '/?#potong-plat', pathMatch: 'prefix' },
  { path: 'potong-plat', redirectTo: '/?#potong-plat', pathMatch: 'prefix' },
  { path: 'contact_us', redirectTo: '/?#contact-us', pathMatch: 'prefix' },
  { path: 'contact-us', redirectTo: '/?#contact-us', pathMatch: 'prefix' },
  { path: 'actuallyapage', component: ActuallyapageComponent},
  { path: 'do-login', component: FormLoginComponent},
  { path: 'do-form', component: FormModeComponent,
    canActivate: [GuardLoginGuard],
    canActivateChild: [GuardChildLoginGuard],
    children: [
      {
        path: 'form-material', component: FormMaterialComponent,
      },
      {
        path: 'form-toko', component: TokoComponent,
      },
      {
        path: 'form-pembelian', component: FormPembelianComponent,
      },
      {
        path: 'form-stock', component: FormStockComponent,
      },
      {
        path: 'form-history', component: FormHistoryComponent,
      },
      {
        path: 'form-history-stock', component: FormHistoryStockComponent,
      }
    ]
  },
  { path: 'do-material', component: FormMaterialComponent },
  { path: '**', redirectTo: '', pathMatch: 'prefix' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    // useHash: true,
    useHash: false,
    initialNavigation: 'enabled',
    onSameUrlNavigation: 'reload',
    scrollPositionRestoration: 'enabled',
    anchorScrolling: 'enabled',
})],
  exports: [RouterModule],
  providers: [
    { provide: LocationStrategy, useClass: HashLocationStrategy },
]
})
export class AppRoutingModule { }
