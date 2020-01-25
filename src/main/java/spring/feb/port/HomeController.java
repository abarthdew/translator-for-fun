package spring.feb.port;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import spring.feb.dao.PapagoDAO;

@Controller
public class HomeController {
	
	@Autowired
	private PapagoDAO dao;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "translator";
	}
	
	@ResponseBody
	@RequestMapping("/translate")
	public String translate(String key) {
		JsonParser parser = new JsonParser();
		String result = dao.papagoNMT(key, "fr", "kr");
		JsonElement root = parser.parse(result);
		JsonObject rootObject = root.getAsJsonObject(); 
		JsonElement message = rootObject.get("message");
		JsonObject messageObject = message.getAsJsonObject();
		
		JsonElement jresult = messageObject.get("result");
		JsonObject resultObject = jresult.getAsJsonObject();
		JsonElement translated = resultObject.get("translatedText");
		String translatedText = translated.getAsString();
		
		return translatedText.toString();
	}
	
}
