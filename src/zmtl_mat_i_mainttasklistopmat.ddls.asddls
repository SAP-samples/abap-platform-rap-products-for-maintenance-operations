@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMTL_MAT: Maintenance Ops - List of Materials'

define root view entity ZMTL_MAT_I_MaintTaskListOpMat
  as select from I_MaintTaskListOpMaterial
  association        to I_ProductText                as _ProductText on  $projection.Product   = _ProductText.Product
                                                                     and (
                                                                        _ProductText.Language  = 'E'
                                                                        or $projection.Product is initial
                                                                      )
  association        to I_UnitOfMeasureText          as _UomText     on  $projection.BillOfMaterialItemUnit = _UomText.UnitOfMeasure
                                                                     and _UomText.Language                  = 'E'
  association        to I_BillOfMaterialItemCategory as _ItemCat     on  $projection.BillOfMaterialItemCategory = _ItemCat.BillOfMaterialItemCategory
  association [0..*] to ZMTL_MAT_I_Supplier          as _Supplier    on  $projection.Product = _Supplier.Product
  //  association [1..*] to I_MfgOrderOperationComponent as _SourceItem  on  $projection.Product = _SourceItem.Material
  //  association to I_Supplier                   as _Supplier    on  $projection.Supplier = _Supplier.Supplier

{
  key TaskListType                                     as TaskListType,
  key TaskListGroup                                    as TaskListGroup,
  key TaskListGroupCounter                             as TaskListGroupCounter,
  key TaskListSequence                                 as TaskListSequence,
  key TaskListOperationInternalId                      as TaskListOperationInternalId,
  key TaskListOpBOMItmInternalID                       as TaskListOpBOMItmInternalID,
  key TaskListOpBOMItmIntVersCounter                   as TaskListOpBOMItmIntVersCounter,
      concat('Task List: ' , concat(TaskListType,
        concat('/', concat(TaskListGroup,
          concat('/', TaskListGroupCounter)))))        as TListTitle,
      _MaintenanceTaskList.TaskListDesc                as TaskListDesc,
      BillOfMaterialCategory                           as BillOfMaterialCategory,
      cast ( BillOfMaterial as abap.sstring( 48 ))     as BoM,
      BillOfMaterialVariant                            as BillOfMaterialVariant,
      BillOfMaterialItemNodeNumber                     as BillOfMaterialItemNodeNumber,
      /*_tlist.MatlCompIsMarkedForBackflush,
        _tlist.IsDeleted,*/
      ResvnIsMRPRlvtOrPurReqnIsCrted                   as ResvnIsMRPRlvtOrPurReqnIsCrted,
      BillOfMaterialComponent                          as Product,
      _ProductText.ProductName                         as ProductDescription,
      @Semantics.quantity.unitOfMeasure: 'BillOfMaterialItemUnit'
      BillOfMaterialItemQuantity                       as BillOfMaterialItemQuantity,
      BillOfMaterialItemUnit                           as BillOfMaterialItemUnit,
      _UomText.UnitOfMeasureName                       as UnitOfMeasureName,
      BillOfMaterialItemCategory                       as BillOfMaterialItemCategory,
      _ItemCat.BillOfMaterialItemCategoryDesc          as BillOfMaterialItemCategoryDesc,
      TechObjIsEquipOrFuncnlLoc                        as TechObjIsEquipOrFuncnlLoc,
      case TechObjIsEquipOrFuncnlLoc
          when 'EAMS_EQUI' then 'Equipment'
          when 'EAMS_FLOC' then 'Functional Location'
          else '-'
      end                                              as TechObjType,
      Equipment                                        as Equipment,
      cast ( FunctionalLocation as abap.sstring( 48 )) as FLOC,
      /* _tlist.ValidityStartDate,
      _tlist.ValidityEndDate,*/
      //      _SourceItem.Supplier                             as Supplier, // field for new entity

      /* Associations */
      _Supplier
      //      _SourceItem
      //      _Supplier // has to be added for supplier!!
}
where
  IsDeleted <> 'X'
