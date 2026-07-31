# Party Data Model Assignment Solution

This repository contains the complete step-by-step solution for the OFBiz Party Data Model assignment. The assignment involves using both the **Party Manager** and **Webtools** interfaces to manage person records, contact mechanisms, and security groups.

---

## Activity 1 – Party Manager (Mark K Tailor)

### 1. Create and Update a Person
*   **Log in** to OFBiz and navigate to the **Party Manager** application.
*   Click on **Create New Person**.
*   Enter **First Name:** `Mark` and **Last Name:** `Tailor`. Save the record.
*   In the Party Profile page, scroll to the **Roles** section, select **Customer** from the drop-down, and click **Add**.
*   Click **Update** on the personal details section, change the First Name/Middle Name to reflect **Mark K Tailor**, and save.

### 2. Add Contact Information
*   Scroll to the **Contact Information** section and click **Create New**.
*   **Email Address:** Select *Email Address*, enter the email, and save.
*   **Billing Phone:** Select *Telecom Number*, enter the number, select *Billing Phone* as the purpose, and save.
*   **Shipping Phone:** Select *Telecom Number*, enter the number, select *Shipping Phone* as the purpose, and save.
*   **Shipping Address:** Select *Postal Address*, enter the address details, select *Shipping Destination Address* as the purpose, and save.
*   **Billing Address:** Select *Postal Address*, enter the address details, select *Billing Address* as the purpose, and save.

### 3. Synchronize and Modify Addresses
*   Edit the Shipping Address. Check the box or select the option to **Set the billing address to be the same** (this synchronizes them).
*   In the Contact Purposes section for the Billing Address, select **General correspondence address** from the drop-down and click Add Purpose.

### 4. Modify Contact Records
*   Find the existing Email Address in the list and click **Expire** (or Delete). Create a new email address.
*   Find the existing Billing Address, click **Expire**, and create a new one.
*   Find the existing Shipping Address, click **Expire**, and create a new one.

---

## Activity 2 – Webtools (John D Liston)

### 1. Create a Person
*   Navigate to **Webtools** -> **Entity Data Maintenance**.
*   Search for the `Person` entity and click **Create**.
*   Enter a new `partyId` (e.g., `JOHN_LISTON`), **First Name:** `John`, **Last Name:** `Liston`.
*   Navigate to the `PartyRole` entity, enter the `partyId`, and set `roleTypeId` to `CUSTOMER`.
*   Go back to the `Person` entity, search for `JOHN_LISTON`, click edit, update the name to **John D Liston**, and save.

### 2. Add/Update Contact Information
*   In Webtools, use the `ContactMech`, `PartyContactMech`, and `PartyContactMechPurpose` entities to manually inject the contact mechanisms.
*   **Email:** Create a `ContactMech` (type `EMAIL_ADDRESS`), link it via `PartyContactMech`, and set the purpose to Primary Email via `PartyContactMechPurpose`.
*   **Phones & Addresses:** Repeat the entity creation process for the Billing Phone, Shipping Phone, and Postal Addresses. 
*   **Synchronize:** When creating the Postal Address in `PartyContactMechPurpose`, add two purpose records (Billing Location and Shipping Location) pointing to the exact same `contactMechId`.
*   Add a third `PartyContactMechPurpose` record with the purpose `GENERAL_LOCATION` (General correspondence).

### 3. Final Updates & Observation
*   To delete, find the existing `PartyContactMech` records in Webtools and set the `thruDate` to the current timestamp (marking them as expired). Create new records for the updated email/addresses.
*   **Observation:** Open the Party Manager, search for John D Liston, and verify that the UI correctly renders all the raw entity data you just manipulated in Webtools.

---

## Activity 3 – Combined Approach (John B Hays)

### 1. Using Party Manager
*   Navigate to Party Manager, create a person named **John Hays**, and assign the **Customer** role.
*   Update the name to **John B Hays**.
*   In Contact Information, add the Email, Billing Phone, and **two separate Shipping Phone** numbers.
*   Add the Shipping and Billing addresses, synchronize them, and add the "General correspondence address" purpose.
*   Scroll to the **Payment Method Information** section, click **Create New Credit Card**, enter the test card details, and save.

### 2. Using Webtools
*   Navigate to **Webtools** -> **Entity Data Maintenance**.
*   Search for the `UserLogin` entity and click **Create**. Enter `userLoginId` (e.g., `jhays`), the `partyId` (John's ID), and a hashed password.
*   Search for the `UserLoginSecurityGroup` entity, enter the `userLoginId`, and set the `groupId` to `PARTYADMIN` (grants Party Manager access).
*   **Verification:** Log out of OFBiz and log back in using `jhays` to verify access to the Party Manager application.

### 3. Final Updates & Observation
*   In Party Manager, expire the email address and recreate it.
*   Expire the billing and shipping addresses and add new ones.
*   **Observation:** The Party Profile page should seamlessly reflect the contact changes, and the user login should actively work with standard permissions.

---

## Activity 4 – Combined Approach (David R Zeneski)

### 1. Using Party Manager
*   Create a person named **David Zeneski**, assign the **Customer** role, and update the name to **David R Zeneski**.
*   Add an email address, billing phone, shipping phone, and addresses (synchronized with General Correspondence purpose).
*   Create a Credit Card record in the Payment Method section.

### 2. Using Webtools
*   Go to `UserLogin` in Webtools and create **two** records (e.g., `dzeneski1` and `dzeneski2`) mapped to David's `partyId`.
*   Go to `UserLoginSecurityGroup`. Assign `dzeneski1` to the `ORDERMGR` group (Order Manager access).
*   Assign `dzeneski2` to the `PARTYADMIN` group (Party Manager access).
*   **Verification:** Log in with both accounts to verify that `dzeneski1` can access the Order Manager and `dzeneski2` can access the Party Manager.

### 3. Final Updates & Observation
*   Use Party Manager to expire the old email and addresses, and create new ones.
*   **Observation:** Review the party profile in the UI to confirm all contact updates are correct and the two user logins are properly listed under the User Name(s) section.
