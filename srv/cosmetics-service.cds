using { sap.ui.cosmetics as my } from '../db/schema';

/** Serves end users browsing books and place orders */
service CatalogService {
  @readonly entity Cosmetics as select from my.Cosmetics {
    ID, name, descr, brands, type, price
  };
  @requires: 'authenticated-user'
  @insertonly entity Orders as projection on my.Orders;

  function getCosmeticsByBrand (id: String) returns array of Cosmetics;
}

/** Serves registered users managing their account and their orders */
@requires: 'authenticated-user'
service UsersService {
  @restrict: [{ grant: 'READ', to: 'buyer' }] // limit to own ones
  @readonly entity Orders as projection on my.Orders; 
}

/** Serves administrators managing everything */
@requires: 'authenticated-user'
service AdminService {
  entity Cosmetics @(restrict : [
            {
                grant : [ '*' ],
                to : [ 'admin' ]
            }
        ])  as projection on my.Cosmetics;
  entity Brands @(restrict : [
            {
                grant : [ '*' ],
                to : [ 'admin' ]
            }
        ])  as projection on my.Brands;
  entity Orders @(restrict : [
            {
                grant : [ '*' ],
                to : [ 'admin' ]
            }
        ]) as projection on my.Orders;
  entity Users @(restrict : [
      {
          grant : [ '*' ],
          to : [ 'admin' ]
      }
  ]) as projection on my.Users;

  function getCosmeticsByOrder (id: String) returns array of String;
  action changeStatusType (orderId: String, orderStatus: String) returns Orders;
}