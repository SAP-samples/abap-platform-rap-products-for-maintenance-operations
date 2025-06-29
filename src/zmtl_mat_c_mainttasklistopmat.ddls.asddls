@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMTL_MAT: Projection on Maintenance Ops - List of Materials'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZMTL_MAT_C_MaintTaskListOpMat
  as projection on ZMTL_MAT_I_MaintTaskListOpMat
{
  key TaskListType,
  key TaskListGroup,
  key TaskListGroupCounter,
  key TaskListSequence,
  key TaskListOperationInternalId,
  key TaskListOpBOMItmInternalID,
  key TaskListOpBOMItmIntVersCounter,
      TListTitle,
      TaskListDesc,
      BillOfMaterialCategory,
      BoM,
      BillOfMaterialVariant,
      BillOfMaterialItemNodeNumber,
      ResvnIsMRPRlvtOrPurReqnIsCrted,
      Product,
      ProductDescription,
      BillOfMaterialItemQuantity,
      BillOfMaterialItemUnit,
      UnitOfMeasureName,
      BillOfMaterialItemCategory,
      BillOfMaterialItemCategoryDesc,
      TechObjIsEquipOrFuncnlLoc,
      TechObjType,
      Equipment,
      FLOC,
      //      Supplier,
      //      _Supplier.SupplierName as SupplierName

      /* Associations */
      _Supplier
      //      _SourceItem
}
