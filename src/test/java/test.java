import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.drug.entity.Menu;
import com.drug.system.mapper.MenuMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class test {
@Autowired
private MenuMapper menuMapper;
	@Test
	public void test() {
		System.out.println("====");
		List<Menu> list = menuMapper.queryByMenu();
		for (Menu m : list) {
			System.out.println(m.getMenuName() +"===" + m.getMenuType());
		}
	}
	

}
