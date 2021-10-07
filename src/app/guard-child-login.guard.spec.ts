import { TestBed } from '@angular/core/testing';

import { GuardChildLoginGuard } from './guard-child-login.guard';

describe('GuardChildLoginGuard', () => {
  let guard: GuardChildLoginGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(GuardChildLoginGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
