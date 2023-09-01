namespace sap.ui.cosmetics;
using { cuid, Country, managed } from '@sap/cds/common';

entity Cosmetics : cuid, managed {
  name  : localized String;
  descr  : localized String;
  type  : localized Types;
  brands : Association to Brands;
  price : Integer;
}

entity Brands : cuid, managed {
  name   : String;
  country  : Country;
  cosmetics : Association to many Cosmetics on cosmetics.brands = $self;
}

type Types : String enum {
  Face; Body; Hands; Legs; Hair;
}

entity Orders : cuid, managed {
  cosmetics : Association to Cosmetics;
  users : Association to Users;
  quantity: Integer;
  status: localized OrderStatuses;
}

type OrderStatuses: String enum{
  Pending; Processing; Ready; 
}

entity Users : cuid, managed {
  name : String;
  email : String;
}
