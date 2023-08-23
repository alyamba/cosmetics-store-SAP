using { sap.ui.cosmetics as my } from '../db/schema';

/** Serves end users browsing books and place orders */
service CatalogService {
  @readonly entity Cosmetics as select from my.Cosmetics {
    ID, name, brands.name as brands
  };
  @requires: 'authenticated-user'
  @insertonly entity Orders as projection on my.Orders;
}

/** Serves registered users managing their account and their orders */
@requires: 'authenticated-user'
service UsersService {
  @restrict: [{ grant: 'READ', where: 'buyer = $user' }] // limit to own ones
  @readonly entity Orders as projection on my.Orders;
  action cancelOrder ( ID:Orders, reason:String );
}

/** Serves administrators managing everything */
@requires: 'authenticated-user'
service AdminService {
  entity Cosmetics   as projection on my.Cosmetics;
  entity Brands as projection on my.Brands;
  entity Orders  as projection on my.Orders;
}