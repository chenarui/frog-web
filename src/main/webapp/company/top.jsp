<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar navbar-default navbar-fixed-top" id="navbar">
	<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

	<div class="navbar-container" id="navbar-container">
		<div class="navbar-header pull-left">
			<a href="#" class="navbar-brand"> <small> <i
					class="icon-leaf"></i> 智慧物流企业端
			</small>
			</a>
			<!-- /.brand -->
		</div>
		<!-- /.navbar-header -->

		<div class="navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">

				<li class="light-blue" id="haunying"><a data-toggle="dropdown"
					href="#" class="dropdown-toggle"> <img class="nav-user-photo"
						src="assets/avatars/user.jpg" alt="Jason's Photo" /> <span
						class="user-info"> <small>欢迎您,</small>
							${sessionScope.loginName2}
					</span> <i class="icon-caret-down"></i>
				</a>

					<ul
						class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close"
						id="dengchuul">
						<li id="dengchu"><a href="./toLoginOut"> <i
								class="icon-off"></i> 登出
						</a></li>
					</ul></li>
			</ul>
			<!-- /.ace-nav -->
		</div>
		<!-- /.navbar-header -->
	</div>
	<!-- /.container -->
</div>