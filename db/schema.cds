namespace sap.ui.cosmetics;
using { cuid, Country } from '@sap/cds/common';

entity Cosmetics : cuid {
  name  : String;
  descr  : String;
  type  : Types;
  brands : Association to Brands;
  price: Integer;
}

entity Brands : cuid {
  name   : String;
  country  : Country;
  cosmetics : Association to many Cosmetics;
}

type Types : String enum {
  Face; Body; Hands; Legs; Hair;
}

entity Orders : cuid {
  cosmetics : Association to many Cosmetics;
  users : Association to Users;
}

entity Users : cuid {
  name : String;
  isAuth : Boolean;
}
