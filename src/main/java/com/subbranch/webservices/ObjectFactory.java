
package com.subbranch.webservices;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.subbranch.webservices package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetBpayStatus_QNAME = new QName("http://webservices.subbranch.com/", "getBpayStatus");
    private final static QName _UpdBrachReceStatusResponse_QNAME = new QName("http://webservices.subbranch.com/", "updBrachReceStatusResponse");
    private final static QName _GetBpayStatusResponse_QNAME = new QName("http://webservices.subbranch.com/", "getBpayStatusResponse");
    private final static QName _UpdBrachReceStatus_QNAME = new QName("http://webservices.subbranch.com/", "updBrachReceStatus");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.subbranch.webservices
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link UpdBrachReceStatus }
     * 
     */
    public UpdBrachReceStatus createUpdBrachReceStatus() {
        return new UpdBrachReceStatus();
    }

    /**
     * Create an instance of {@link UpdBrachReceStatus.Arg0 }
     * 
     */
    public UpdBrachReceStatus.Arg0 createUpdBrachReceStatusArg0() {
        return new UpdBrachReceStatus.Arg0();
    }

    /**
     * Create an instance of {@link GetBpayStatusResponse }
     * 
     */
    public GetBpayStatusResponse createGetBpayStatusResponse() {
        return new GetBpayStatusResponse();
    }

    /**
     * Create an instance of {@link GetBpayStatus }
     * 
     */
    public GetBpayStatus createGetBpayStatus() {
        return new GetBpayStatus();
    }

    /**
     * Create an instance of {@link UpdBrachReceStatusResponse }
     * 
     */
    public UpdBrachReceStatusResponse createUpdBrachReceStatusResponse() {
        return new UpdBrachReceStatusResponse();
    }

    /**
     * Create an instance of {@link UpdBrachReceStatus.Arg0 .Entry }
     * 
     */
    public UpdBrachReceStatus.Arg0 .Entry createUpdBrachReceStatusArg0Entry() {
        return new UpdBrachReceStatus.Arg0 .Entry();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBpayStatus }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices.subbranch.com/", name = "getBpayStatus")
    public JAXBElement<GetBpayStatus> createGetBpayStatus(GetBpayStatus value) {
        return new JAXBElement<GetBpayStatus>(_GetBpayStatus_QNAME, GetBpayStatus.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdBrachReceStatusResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices.subbranch.com/", name = "updBrachReceStatusResponse")
    public JAXBElement<UpdBrachReceStatusResponse> createUpdBrachReceStatusResponse(UpdBrachReceStatusResponse value) {
        return new JAXBElement<UpdBrachReceStatusResponse>(_UpdBrachReceStatusResponse_QNAME, UpdBrachReceStatusResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBpayStatusResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices.subbranch.com/", name = "getBpayStatusResponse")
    public JAXBElement<GetBpayStatusResponse> createGetBpayStatusResponse(GetBpayStatusResponse value) {
        return new JAXBElement<GetBpayStatusResponse>(_GetBpayStatusResponse_QNAME, GetBpayStatusResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdBrachReceStatus }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices.subbranch.com/", name = "updBrachReceStatus")
    public JAXBElement<UpdBrachReceStatus> createUpdBrachReceStatus(UpdBrachReceStatus value) {
        return new JAXBElement<UpdBrachReceStatus>(_UpdBrachReceStatus_QNAME, UpdBrachReceStatus.class, null, value);
    }

}
