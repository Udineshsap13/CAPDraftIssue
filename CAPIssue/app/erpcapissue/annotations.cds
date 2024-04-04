using BusinesspartnerService as service from '../../srv/bp-service';

annotate service.BusinessPartner with @(
    UI:{
        SelectionFields: [
            Name,
        ],
        LineItem : [
            {
                $Type : 'UI.DataField',
                Label : 'ObjectID',
                Value : ObjectID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
        ],
        HeaderInfo : {
            TypeImageUrl   : '',
            Title          : {Value : UUID},
            Description    : {Value : Description}
        },
        HeaderFacets                         : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>GeneralInformation}',
                ID     : 'HeaderFacetInfo',
                Target : '@UI.FieldGroup#HeaderGeneralInformation'
            }
        ],
        Facets  : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>GeneralInformation}',
                ID     : 'CorrespondenceTemplateConfigurationProperties',
                Target : '@UI.FieldGroup#HeaderGeneralInformation'
            },
            {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Addresses}',
            ID     : 'Addresses',
            Target : 'OurTeams/@UI.LineItem',
        },
        ],
        FieldGroup #HeaderGeneralInformation : {
            Data : [
                { Value : Name, Label : '{i18n>Name}' },
                { Value : ObjectID, Label : '{i18n>ObjectID}' }
            ]
        }
    }
);

annotate service.BusinessPartnerIPDataOurTeam with @(UI: {
    LineItem: [
        {
            $Type            : 'UI.DataField',
            Value            : Title,
        },
        {
            $Type            : 'UI.DataField',
            Value            : ObjectID,
        }
    ]
});