using AdminService as service from '../../srv/cosmetics-service';
using { sap.ui.cosmetics as CosmeticsSchema } from '../../db/schema';

annotate service.Orders with @(
Common.ValueList: {
  CollectionPath: 'OrderStatuses',
  Parameters: [
    { LocalDataProperty: 'status', ValueListProperty: 'EnumMember' }
  ]
},
  Common.SemanticKey: [ID],
  UI                : {
    Identification       : [

    ],
    SelectionFields      : [
      users.name,
      users.email,
      cosmetics.name,
      status
    ],
    LineItem             : [
      {Value: ID},
      {Value: users.name},
      {Value: users.email},
      {Value: cosmetics.name},
      {Value: cosmetics.brands.name},
      {Value: cosmetics.brands.country_code},
      {Value: cosmetics.price},
      {Value: quantity},
      {Value: status},
      {
        $Type              : 'UI.DataFieldForAction',
        Label              : 'Change order status',
        Action             : 'AdminService.EntityContainer/changeStatusType',
        ![@UI.IsCopyAction]: true,
      },
    ],

    HeaderFacets         : [{
      $Type : 'UI.ReferenceFacet',
      Label : '{@i18n>Order Info}',
      Target: '@UI.FieldGroup#OrderData'
    }, ],
    FieldGroup #OrderData: {
      $Type: 'UI.FieldGroupType',
      Data : [
        {
          $Type            : 'UI.DataField',
          Value            : cosmetics.name,
          ![@UI.Importance]: #High
        },
        {
          $Type            : 'UI.DataField',
          Value            : cosmetics.price,
          ![@UI.Importance]: #High,
        },
        {
          $Type            : 'UI.DataField',
          Value            : quantity,
          ![@UI.Importance]: #High
        },
        {
          $Type            : 'UI.DataField',
          Value            : status,
          ![@UI.Importance]: #High
        }
      ]
    },
    FieldGroup #BrandData: {
      $Type: 'UI.FieldGroupType',
      Data : [
        {
          $Type            : 'UI.DataField',
          Value            : cosmetics.brands.name,
          ![@UI.Importance]: #High
        },
        {
          $Type            : 'UI.DataField',
          Value            : cosmetics.brands.country_code,
          ![@UI.Importance]: #High,
        }
      ]
    },
    FieldGroup #UserData : {
      $Type: 'UI.FieldGroupType',
      Data : [
        {
          $Type            : 'UI.DataField',
          Value            : users.name,
          ![@UI.Importance]: #High
        },
        {
          $Type            : 'UI.DataField',
          Value            : users.email,
          ![@UI.Importance]: #High,
        }
      ]
    },

    Facets               : [
      {
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>Order Info}',
        Target: '@UI.FieldGroup#OrderData',

      },
      {
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>User Info}',
        Target: '@UI.FieldGroup#UserData',
      },
      {
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>Brand Info}',
        Target: '@UI.FieldGroup#BrandData',
      }
    ]
  },

  UI.HeaderInfo     : {
    TypeName      : 'Order',
    TypeNamePlural: 'Orders',
    Title         : {
      $Type: 'UI.DataField',
      Value: ID
    },
    Description   : {
      $Type: 'UI.DataField',
      Value: users.email
    }
  },
);


// annotate service.Orders with {
//     status       @Common : {
//         Text            : status,
//         TextArrangement : #TextOnly,
//         ValueListWithFixedValues,
//         ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'Orders',
//         },
//     };
// };
// type CustomDropdownEnum : String {
//   enum: 'Value1', 'Va===lue2', 'Value3'
// }
