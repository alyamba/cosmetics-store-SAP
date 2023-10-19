using AdminService from './cosmetics-service';

annotate AdminService.Cosmetics with {
  name @title : 'Cosmetics name';
  descr @title : 'Description';
  type @title : 'Comsetics Type';
  brands @title : 'Brand';
  price @title : 'Price'
};

annotate AdminService.Brands with {
    name  @title: 'Brand name';
    country        @title: 'Country';
    cosmetics     @title: 'Catalog';
};

annotate AdminService.Users with {
    name  @title: 'User name';
    email        @title: 'Email';
};

annotate AdminService.Orders with {
    quantity  @title: 'Quantity of goods';
    status        @title: 'Status';
};

