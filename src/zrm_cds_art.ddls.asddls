@AbapCatalog.sqlViewName: 'ZRM_V_CDS_ART'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VISTA ART ARTE'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view ZRM_CDS_ART as select from zrmr_tab_art
{
  //  key client as client,
    key id_art as IdArt,
    descr as Descr,
    desc2 as Desc2,
    color as Color,
    pzs as Piezas,
    stock as Stock,
    url as Url,
    
        // 0 neutral grey
        // 1 negative red
        // 2 critical yellow
        // 3 positive green
        
        case
        when stock = 0 then 0
        when stock between 1 and 10 then 1
        when stock between 11 and 99 then 2
        when stock >= 100 then 3
        else 0
        end as status
}
