using AdminService as service from '../../srv/cosmetics-service';

annotate service.Cosmetics with @(
    Common.SemanticKey: [ID],
    UI: {
      Identification  : [
      
      ],
      SelectionFields  : [
          name, type, brands.name, price
      ],
      LineItem  : [
          {Value: name},
          {Value: descr},
          {Value: type},
          {Value: brands.name},
          {Value: brands.country_code},
          {Value: price},
      ],
    }
);