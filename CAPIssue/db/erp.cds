namespace erp;

entity BusinessPartner {
    key UUID : UUID; 
    ObjectID : String; 
    Name : String;
    IPData: Composition of BusinessPartnerIPData on IPData.BusinessPartnerUUID = UUID;
    OurTeams: Composition of many BusinessPartnerIPDataOurTeam on OurTeams.ParentUUID = UUID;
};

entity BusinessPartnerIPData {
    key UUID : UUID; 
    ObjectID : String; 
    ParentObjectID : String;
    BusinessPartnerUUID: UUID;
    Title: String;
    OurTeams: Composition of many BusinessPartnerIPDataOurTeam on OurTeams.ParentObjectID = ObjectID;
};

entity BusinessPartnerIPDataOurTeam {
    key UUID : UUID; 
    ObjectID : String; 
    ParentObjectID : String;
    ParentUUID : UUID;
    Title: String;
};