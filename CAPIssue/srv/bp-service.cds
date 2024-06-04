using erp from '../db/erp';

service BusinesspartnerService {
    // @odata.draft.enabled
    // @Capabilities.Insertable: true
    // @Capabilities.Deletable: true
    entity BusinessPartner as projection on erp.BusinessPartner;

    entity BusinessPartnerIPData as projection on erp.BusinessPartnerIPData;
    entity BusinessPartnerIPDataOurTeam as projection on erp.BusinessPartnerIPDataOurTeam;

    entity Table1 as projection on erp.Table1;
    entity Table2 as projection on erp.Table2;
    entity TableMessageView as projection on erp.TableMessageView;
}