public with sharing class PDFController {
    @AuraEnabled
    public static Attachment generatePDF(Id recordId,String htmlData){
        PageReference page=PAge.renderAsPDF;
        page.getParameters().put('pdfText',htmlData);

        Contact con=new Contact(Id=recordId);
        Attachment objAttachment=new Attachment();
        objAttachment.Name='invoice.pdf';
        objAttachment.ParentId=con.id;
        objAttachment.body=page.getContentAsPDF();
        objAttachment.IsPrivate=false;
        insert objAttachment;
        return objAttachment;
    }
}