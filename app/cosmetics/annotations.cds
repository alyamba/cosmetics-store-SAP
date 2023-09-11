using AdminService as service from '../../srv/cosmetics-service';

annotate service.Cosmetics with @(
    Common.SemanticKey: [ID],
    UI                : {
        Identification     : [

        ],
        SelectionFields    : [
            name,
            type,
            brands.name,
            price
        ],
        LineItem           : [
            {Value: name},
            {Value: descr},
            {Value: type},
            {Value: brands.name},
            {Value: brands.country_code},
            {Value: price},
        ],

        HeaderFacets       : [{
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
        FieldGroup #BrandData: {
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

        Facets             : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Product Info}',
                Target: '@UI.FieldGroup#ProductData',
                
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Brand Info}',
                Target: '@UI.FieldGroup#BrandData',
            //     ![@UI.Hidden] : IsActiveEntity
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
