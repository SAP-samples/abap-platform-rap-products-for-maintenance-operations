@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMTL_MAT - View for Supplier'
@Metadata.allowExtensions: true
define view entity ZMTL_MAT_I_Supplier
  as select from I_MfgOrderOperationComponent
{

  key Reservation                as Reservation,
  key ReservationItem            as ReservationItem,
  key RecordType                 as RecordType,
      Material                   as Product,
      Supplier                   as Supplier,
      _SupplierText.SupplierName as SupplierName
}
