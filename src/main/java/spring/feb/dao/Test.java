package spring.feb.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        String[] files = new String[]{
                "pagefile.sys",
                "p.agefile.sys",
                "c:\\logs\\abcd.log",
                "c:\\/logs\\abcd.log",
                "/files/collection/test.file.txt",
                "/usr/root/image",
                "/\\usr/root/image",
                "abc",
                "def.sv"
        };
        
        int lastIndex=0;
        int secondIndex=0;
        int thirdIndex=0;
        String first = null;
        String last = null;
    	List<String> result = new ArrayList();
    	
        for(int i=0; i<files.length; i++) {
        	lastIndex = files[i].lastIndexOf("/"); 
        	first = files[i].substring(lastIndex+1); 
    		secondIndex = files[i].lastIndexOf("\\"); 
        	last = first.substring(secondIndex+1); 
        	thirdIndex = files[i].lastIndexOf(".");
        	if(thirdIndex!=-1) {
        		if(lastIndex>secondIndex) {
        			result.add(files[i].substring(lastIndex+1, thirdIndex));
        		}else {
        			result.add(files[i].substring(secondIndex+1, thirdIndex));
        		}
        	}else {
        		if(lastIndex>secondIndex) {
        			result.add(first);
        		}else {
        			result.add(last);
        		}
        	}
        }
        
        
        /**
         * 결과값
         * pagefile
         * abcd
         * test.file
         * image
         *
       
         * + 보너스 문제 : 파일명순으로 정렬하시오.
         * abcd
         * image
         * pagefile
         * test.file
         */
        

        
        // 오름차순 정렬
           Collections.sort(result, new Comparator<String>() {
               @Override
               public int compare(String word1, String word2) {
                   return word2.compareTo(word1);
               }
               
           });

           for(String rs : result) {
           	System.out.println(rs);
           }
           
           //출력 결과 :
//           abc
//           abcd
//           def
//           image
//           p.agefile
//           pagefile
//           test.file
           
           
    }
}
