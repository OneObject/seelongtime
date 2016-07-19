/**
 * 
 */
package com.longtime.app.org.adl;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.adl.server.ChapterDTO;
import org.adl.util.debug.DebugIndicator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * @author congwang
 * 
 */
public class MainfestProcess {
    /*
     * 获取首页地址 王聪 param：filePath，课件路径（上传解压后的根目录）+"/imsmanifest.xml" return：返回首页地址
     */
    public static String getFirstHref(String filePath) {
        System.out.println("----------" + filePath);
        String alteredLocation = new String();
        DocumentBuilderFactory domfac = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder dombuilder = domfac.newDocumentBuilder();
            InputStream is = new FileInputStream(filePath);
            Document doc = dombuilder.parse(is);
            Element root = doc.getDocumentElement();
            NodeList nodeList = root.getChildNodes();

            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);

                if ("resources".equals(node.getNodeName())) {
                    NodeList childList = node.getChildNodes();
                    for (int j = 0; j < childList.getLength(); j++) {
                        Node childNode = childList.item(j);
                        if ("resource".equals(childNode.getNodeName())) {
                            alteredLocation = childNode.getAttributes()
                                    .getNamedItem("href").getNodeValue();
                            break;
                        }

                    }

                    break;
                }
                if(DebugIndicator.ON == true) {
                    System.out.println("-----" + node.getNodeName());
                }
            }

        } catch (ParserConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SAXException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return alteredLocation;
    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        //vedio arts F:\\workroom\\lt.2008.12.learningExpress\\webapp\\scormfile\\extract\\1225952383781\\imsmanifest.xml
        //F:\\workroom\\lt.2008.12.learningExpress\\webapp\\scormfile\\extract\\1237959194984\\imsmanifest.xml
        
        //parseImsmanifestXml("F:\\workroom\\lt.2008.12.learningExpress\\webapp\\scormfile\\extract\\1225952383781\\imsmanifest.xml");
        parseImsmanifestXml("F:\\workroom\\lt.2008.12.learningExpress\\webapp\\scormfile\\extract\\1237959194984\\imsmanifest.xml");
    }

    
    /*
     * 获取课件的章节 王聪
     * param：filePath，课件路径（上传解压后的根目录）+"/imsmanifest.xml"
     * return：章节的目录结构
     */
    public static List parseImsmanifestXml(String filePath) {
        System.out.println("----------" + filePath);
        String alteredLocation = new String();
        DocumentBuilderFactory domfac = DocumentBuilderFactory.newInstance();
        List list=new ArrayList();
        try {
            DocumentBuilder dombuilder = domfac.newDocumentBuilder();
            InputStream is = new FileInputStream(filePath);
            Document doc = dombuilder.parse(is);
            Element root = doc.getDocumentElement();

            NodeList nodeList = root.getChildNodes();

            Map map=new HashMap();
            
            NodeList items = root.getElementsByTagName("item");
            NodeList resources = root.getElementsByTagName("resource");
            NodeList organization = root.getElementsByTagName("organization");
            
            if(organization.item(0).getFirstChild().getNextSibling()!=null){
                ChapterDTO chapterDTO=new ChapterDTO();
                System.out.println("标记名称: "+organization.item(0).getFirstChild().getNextSibling().getNodeName());
                //如果根节点没有名称，则取名为章节根目录
                if(organization.item(0).getFirstChild().getNextSibling().getNodeName().equals("title")){
                    System.out.println("Title: "+organization.item(0).getFirstChild().getNextSibling().getTextContent());
                    chapterDTO.setTitle(organization.item(0).getFirstChild().getNextSibling().getTextContent());
                }else{
                    System.out.println("章节根目录");
                    chapterDTO.setTitle("章节根目录");
                }
                System.out.println("Identifier: "+organization.item(0).getAttributes().getNamedItem("identifier").getNodeValue());
                chapterDTO.setIdentifier(organization.item(0).getAttributes().getNamedItem("identifier").getNodeValue());
                map.put(chapterDTO.getIdentifier(), chapterDTO);
                list.add(chapterDTO);
            }
          
            for (int i = 0; i < items.getLength(); i++)
            {
                ChapterDTO chapterDTO=new ChapterDTO();
                Node node = items.item(i);
                
                node.getParentNode();
                
                System.out.println("");
                System.out.println("当前item节点"+node.getAttributes().getNamedItem("identifier"));
                
                 NamedNodeMap namedNodeMap=node.getAttributes();
                    if(namedNodeMap!=null){
                        if((namedNodeMap.getNamedItem("identifier")!=null)&&(i!=0)){
                            
                                System.out.println("identifier :"+namedNodeMap.getNamedItem("identifier").getNodeValue());
                                chapterDTO.setIdentifier(namedNodeMap.getNamedItem("identifier").getNodeValue());
                                
                                if(node.getFirstChild().getNextSibling()!=null){
                                     chapterDTO.setTitle(node.getFirstChild().getNextSibling().getTextContent());
                                }else {
                                     chapterDTO.setTitle(node.getFirstChild().getTextContent());
                                }
                                System.out.println("章节名称"+chapterDTO.getTitle());
                                
//                              chapterDTO.setTitle(node.getFirstChild().getTextContent());
                                
                                 if((namedNodeMap.getNamedItem("identifierref")!=null)){
                                     System.out.println("identifierref: "+namedNodeMap.getNamedItem("identifierref").getNodeValue());
                                     chapterDTO.setIdentifierref(namedNodeMap.getNamedItem("identifierref").getNodeValue());
                                     
                                     chapterDTO.setLocation(getResourceLocation(  resources ,chapterDTO.getIdentifierref()));
                                 }                               
                                 
                                 
//                               if(node.getParentNode().getNodeName().equals("item")){
                                     
                                     System.out.println("Parent_id:"+node.getParentNode().getAttributes().getNamedItem("identifier").getNodeValue());
                                    
                                     chapterDTO.setParent_id(node.getParentNode().getAttributes().getNamedItem("identifier").getNodeValue());
                                   
                                  
                                     map.put(chapterDTO.getIdentifier(), chapterDTO);
                                     list.add(chapterDTO);
//                              }
                                
                        }
                        else if((namedNodeMap.getNamedItem("identifier")!=null)&&(i==0)){
                    
                                chapterDTO.setIdentifier(namedNodeMap.getNamedItem("identifier").getNodeValue());
                                
                               
                           
                               
                                if(node.getFirstChild().getNextSibling()!=null){
                                     chapterDTO.setTitle(node.getFirstChild().getNextSibling().getTextContent());
                                }else {
                                     chapterDTO.setTitle(node.getFirstChild().getTextContent());
                                }
                                
                                System.out.println("章节名称"+chapterDTO.getTitle());
                                
                                // if(organization.item(0).getFirstChild().getNextSibling()!=null){
                                     System.out.println("--Parent_id:"+organization.item(0).getAttributes().getNamedItem("identifier").getNodeValue());
                                    
                                     chapterDTO.setParent_id(organization.item(0).getAttributes().getNamedItem("identifier").getNodeValue());
                                    
                                     map.put(chapterDTO.getIdentifier(), chapterDTO);
                                     list.add(chapterDTO);
                               //  }
                                 if((namedNodeMap.getNamedItem("identifierref")!=null)){
                                    
                                     chapterDTO.setIdentifierref(namedNodeMap.getNamedItem("identifierref").getNodeValue());
                                     
                                     chapterDTO.setLocation(getResourceLocation(  resources ,chapterDTO.getIdentifierref()));
                                 }  
                        }
                        
                    }
            }

        } catch (ParserConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SAXException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return list;
    }



public static String  getResourceLocation(NodeList nodeList,String identifier){
    String retunString = "";
    for(int i=0;i<nodeList.getLength();i++){
        Node node = nodeList.item(i);
        NamedNodeMap namedNodeMap=node.getAttributes();
//      System.out.println("文件xml的属性大小"+namedNodeMap.getLength()+"---------"+identifier+"------"+namedNodeMap.getNamedItem("identifier").getNodeValue());
        if(identifier.equals(namedNodeMap.getNamedItem("identifier").getNodeValue())){
            retunString=namedNodeMap.getNamedItem("href").getNodeValue();
            break;
        }
    }
    System.out.println("文件路径"+retunString);
    return retunString;
}

}