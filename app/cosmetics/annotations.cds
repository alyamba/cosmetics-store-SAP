using AdminService as service from '../../srv/cosmetics-service';

annotate service.Cosmetics with @(
    Common.SemanticKey: [ID],
    UI                : {
        Identification         : [

        ],
        SelectionFields        : [
            name,
            type,
            brands.name,
            brands.country_code,
            price
        ],
        LineItem               : [
            {Value: name},
            {Value: descr},
            {Value: type},
            {Value: brands.name},
            {Value: brands.country_code},
            {Value: price},
        ],

        HeaderFacets           : [{
            $Type : 'UI.ReferenceFacet',
            Label : '{@i18n>Product Info}',
            Target: '@UI.FieldGroup#ProductData'
        }, ],
        FieldGroup #ProductData: {
            $Type: 'UI.FieldGroupType',
            Data : [
                {
                    $Type            : 'UI.DataField',
                    Value            : name,
                    ![@UI.Importance]: #High
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : descr,
                    ![@UI.Importance]: #High,
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : price,
                    ![@UI.Importance]: #High
                }
            ]
        },
        FieldGroup #BrandData  : {
            $Type: 'UI.FieldGroupType',
            Data : [
                {
                    $Type            : 'UI.DataField',
                    Value            : brands.name,
                    ![@UI.Importance]: #High
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : brands.country_code,
                    ![@UI.Importance]: #High,
                }
            ]
        },

        Facets                 : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Product Info}',
                Target: '@UI.FieldGroup#ProductData',

            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Brand Info}',
                Target: '@UI.FieldGroup#BrandData',
            }
        ]
    },

    UI.HeaderInfo     : {
        TypeName      : 'Cosmetics',
        TypeNamePlural: 'Cosmetics',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr
        }
    }, 


);

annotate service.Brands with {
    @Common.Label : 'Country'
    @Common : {
        Text            : country_code,
        TextArrangement : #TextOnly
    }
    @Common.ValueListWithFixedValues : true
    @Common.ValueList : {
        $Type : 'Common.ValueListType',
        Label : 'Country',
        CollectionPath : 'Countries',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : country_code, 
                ValueListProperty : 'code'
            }
        ]
    }
    @Core.Description : 'A country code as specified in ISO 4217'
    country
};

annotate service.Cosmetics with {
    @Common.Label : 'Type'
    @Common : {
        Text            : type,
        TextArrangement : #TextOnly
    }
    @Common.ValueListWithFixedValues : true
    @Common.ValueList: 
      {
        $Type: 'type',
        $FixedValues: true,
        $Values: [
          { $EnumMember: 'Pending', $Description: 'Pending' },
          { $EnumMember: 'Processing', $Description: 'Processing' },
          { $EnumMember: 'Ready', $Description: 'Ready' }
        ]
      }
    // @Common.ValueList : {
    //     $Type : 'Common.ValueListType',
    //     Label : 'Types',
    //     CollectionPath : 'CosmeticsTypes',
    //     Parameters : [
    //         {
    //             $Type : 'Common.ValueListParameterInOut',
    //             LocalDataProperty : type, 
    //             ValueListProperty : 'type'
    //         }
    //     ]
    // }
    @Core.Description : 'A country code as specified in ISO 4217'
    type
};

annotate service.Cosmetics with {
    @Common.FilterDefaultValue : 50
    price
};
