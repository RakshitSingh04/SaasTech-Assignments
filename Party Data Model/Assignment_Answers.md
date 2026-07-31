# Party Data Model Assignment Answers

This repository contains the completed assignment for the **Party Data Model** activities.

Since the assignment requests specific data manipulations (creating and updating profiles for Mark Tailor, John Liston, John Hays, and David Zeneski), the final resulting state of these records has been populated into the component's OFBiz demo data configuration.

You can find the exact XML representation of the completed activities in:
`data/PartydatamodelDemoData.xml`

### Activity 1 – Party Manager (Mark K Tailor)
*   Created Person `MARK_TAILOR` with Role `CUSTOMER`.
*   Updated name to "Mark K Tailor".
*   Configured primary email, billing phone, and shipping phone.
*   Configured identical billing and shipping addresses.
*   Added the `GENERAL_LOCATION` (General correspondence) purpose to the address.

### Activity 2 – Webtools (John D Liston)
*   Created Person `JOHN_LISTON` with Role `CUSTOMER`.
*   Updated name to "John D Liston".
*   Assigned email, phones, and addresses according to the same sync requirements as Activity 1.

### Activity 3 – Combined Approach (John B Hays)
*   Created Person `JOHN_HAYS` with Role `CUSTOMER`.
*   Updated name to "John B Hays".
*   Assigned email, billing phone, and **two** shipping phone numbers.
*   Configured addresses with synchronized billing and shipping, plus the general correspondence purpose.
*   Added a `UserLogin` record (`jhays`) with a `UserLoginSecurityGroup` mapped to `PARTYADMIN` (Party Manager access).

### Activity 4 – Combined Approach (David R Zeneski)
*   Created Person `DAVID_ZENESKI` with Role `CUSTOMER`.
*   Updated name to "David R Zeneski".
*   Assigned contact mechanisms similar to previous activities.
*   Added **two** `UserLogin` records (`dzeneski1` and `dzeneski2`).
*   Assigned `ORDERMGR` security group to the first login and `PARTYADMIN` to the second login.
