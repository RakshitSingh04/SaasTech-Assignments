import org.apache.ofbiz.base.util.UtilDateTime

def createRelContactMechAndLink() {
    Map result = success()
    
    // 1. Create the Contact Mechanism
    Map createCmCtx = [
        contactMechTypeId: parameters.contactMechTypeId,
        infoString: parameters.infoString,
        userLogin: parameters.userLogin
    ]
    Map createCmResult = run service: "createRelContactMech", with: createCmCtx
    String contactMechId = createCmResult.contactMechId
    
    // 2. Link it to the Party
    Map createLinkCtx = [
        partyId: parameters.partyId,
        contactMechId: contactMechId,
        fromDate: UtilDateTime.nowTimestamp(),
        userLogin: parameters.userLogin
    ]
    run service: "createRelPartyContactMech", with: createLinkCtx
    
    return result
}
