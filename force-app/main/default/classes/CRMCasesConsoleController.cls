public class CRMCasesConsoleController {

    private ApexPages.StandardSetController controller;

    public List<Case> cases {
        get { return controller.getRecords(); }
    }

    public Integer page {
        get { return controller.getPageNumber(); }
    }

    public Integer pageSize {
        get { return controller.getPageSize(); }
    }
    
    public Integer totalPages {
        get {
            Decimal totalPages = (Decimal) totalSize / (Decimal) pageSize;
            return (Integer) totalPages.round( System.RoundingMode.UP );
        }
    }

    public Integer totalSize {
        get { return controller.getResultSize(); }
    }

    public Boolean hasNextPage {
        get { return controller.getHasNext(); }
    }

    public Boolean hasPreviousPage {
        get { return controller.getHasPrevious(); }
    }

    public CRMCasesConsoleController() {
        initSetController();
    }
    
    private void initSetController() {
        this.controller = new ApexPages.StandardSetController( Database.getQueryLocator([
            SELECT
                Id, CaseNumber, Subject, Origin, Priority, Status
            FROM
                Case
            WHERE
                IsClosed = false
            ORDER BY
                CreatedDate DESC
        ]));
    }
    
    public void refreshPage() {
        Integer page = this.controller.getPageNumber(); // remember current page
        initSetController(); // re-instantiate records
        this.controller.setPageNumber( page ); // move back to original page
    }
    
    public void firstPage() {
        controller.first();
    }

    public void nextPage() {
        controller.next();
    }

    public void previousPage() {
        controller.previous();
    }

}