package com.group4.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// URL �젒�냽 �떆 [而⑦듃濡ㅻ윭 �겢�옒�뒪�쓽 硫붿냼�뱶] �샇異� �쟾 �삉�뒗 �썑�뿉 
// �떎�뻾�맆 硫붿냼�뱶瑜� �냼�쑀�븳 [SessionInterceptor �겢�옒�뒪] �꽑�뼵 �꽑�뼵
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// 而⑦듃濡ㅻ윭 �겢�옒�뒪�쓽 硫붿냼�뱶] �샇異� �쟾 �삉�뒗 �썑�뿉 �떎�뻾�맆 硫붿냼�뱶瑜� �냼�쑀�븳 �겢�옒�뒪媛� �맆 �옄寃� 議곌굔
	//---------------------------------------------------------------
	//		<1> 스프링이 제공하는 [HandlerInterceptorAdapter 클래스]를 상속 받는다.
	//		<2> HandlerInterceptorAdapter 클래스의 preHandle 메소드를 재정의한다.
	// 		<3> servlset-context.xml 파일에 다음 태그를 삽입한다.
	//---------------------------------------------------------------
			//		<interceptors>
			//		<interceptor>
			//			<mapping path="/**/*" />
			//		    <exclude-mapping path="/loginForm.do"/>
			//		    <exclude-mapping path="/loginProc.do"/>
			//		    <beans:bean class="com.naver.erp.SessionInterceptor"></beans:bean>            
			//		</interceptor>        
			//		</interceptors>
	//---------------------------------------------------------------
		//*************************************************
		// [HandlerInterceptorAdapter 객체]의 메소드 종류와 호출 시점
		//*************************************************
		// preHandle()       : Controller 클래스의 메소드 실행 전에 호출. boolean 값을 return하며 Controller 클래스의 특정 메소드 실행 여부를 결정
		// postHandle()      : Controller 클래스의 메소드 실행 후, JSP를 실행 전에 호출
		// afterCompletion() : Controller 클래스의 메소드 실행 후, JSP를 실행 후 호출됨. responseBody를 이용할 경우 값을 클라이언트에 전달 후 호출

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
public class SessionInterceptor extends HandlerInterceptorAdapter {	
	//*************************************************
	// URL 접속 시 '컨트롤러 클래스의 메소드' 호출 전에 실행될 preHandle(~) 메소드 선언
	// 메소드가 false를 리턴하면 메소드 호출 후 컨트롤러의 메소드를 호출하지 않고, 반대면 호출한다.
	//*************************************************
	@Override
	public boolean preHandle(
		HttpServletRequest request 
		, HttpServletResponse response 
		, Object handler
	) throws Exception {
		//-------------------------------------
		// HttpSession 객체의 메모리위치주소값 얻기
		// HttpServletRequest 객체의 getSession() 메소드로 얻는다.
		//-------------------------------------
		HttpSession session = request.getSession();   
		//-------------------------------------
		// Session 객체에서 키값이 admin_id로 저장된 데이터 꺼내기
		// 즉 로그인 정보 꺼내기
		//-------------------------------------
		String admin_id = (String) session.getAttribute("admin_id");		
		//-------------------------------------
		// 컨텍스트 루트명 구하기. 컨텍스트 루트는 URL 주소에 존재하는 프로젝트명을 뜻한다.
		//-------------------------------------
		String ctRoot  = request.getContextPath();
		
		// 접속 URI 구하기
		String uri = request.getRequestURI();
		
		//admin_id가 null이면, 즉 로그인한 적이 없다면
		if(admin_id==null) {
			//HttpServletResponse 객체의 sendRedirect 메소드 호출로
			//클라이언트가 /logout.do로 재접속하라고 설정
		
			response.sendRedirect( ctRoot+"/logout.do" );
			System.out.println("<접속 성공> [접속 URI]->"+uri+" [호출메소드]->SessionInterceptor.preHandle() \n");
			
			// false 값을 리턴하기
			// false 값을 리턴하면 컨트롤러 클래스의 메소드는 호출되지 않는다.
			return false;
		} 
		//-------------------------------------
		// admin_id가 null이 아니면, 즉 로그인한 적이 있으면
		//-------------------------------------
		else { 
			System.out.println("<접속 성공> [접속 URI]->"+uri+" [호출메소드]->SessionInterceptor.preHandle() \n");
			
			// true 값을 리턴하기
			// true 값을 리턴하면 컨트롤러 클래스의 메소드가 호출된다.
			return true;
		}
	}
}
