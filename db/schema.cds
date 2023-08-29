namespace sap.ui.cosmetics;
using { cuid, Country, managed } from '@sap/cds/common';

entity Cosmetics : cuid, managed {
  name  : localized String;
  descr  : localized String;
  type  : localized Types;
  brands : Association to Brands;
  price: Integer;
}

entity Brands : cuid, managed {
  name   : String;
  country  : Country;
  cosmetics : Association to many Cosmetics;
}

type Types : String enum {
  Face; Body; Hands; Legs; Hair;
}

entity Orders : cuid, managed {
  cosmetics : Association to many Cosmetics;
  users : Association to Users;
}

entity Users : cuid, managed {
  name : String;
  isAuth : Boolean;
}
