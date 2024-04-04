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
            TypeName : 'BusinessPartner',
            TypeNamePlural : 'BusinessPartners',
            Title          : {Value : UUID},
            Description    : {Value : Name}
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
                Label  : '{i18n>DirectRelation}',
                ID     : 'DirectRelation',
                Target : 'OurTeams/@UI.LineItem',
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>ChainedRelation}',
                ID     : 'ChainedRelation',
                Target : 'IPData/OurTeams/@UI.LineItem',
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