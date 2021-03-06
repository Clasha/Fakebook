select * from member;
select * from hash;


ALTER TABLE friend
	DROP
		CONSTRAINT FK_member_TO_friend
		CASCADE;

ALTER TABLE friend
	DROP
		CONSTRAINT FK_member_TO_friend2
		CASCADE;

ALTER TABLE board
	DROP
		CONSTRAINT FK_member_TO_board
		CASCADE;

ALTER TABLE b_like
	DROP
		CONSTRAINT FK_member_TO_b_like
		CASCADE;

ALTER TABLE b_like
	DROP
		CONSTRAINT FK_board_TO_b_like
		CASCADE;

ALTER TABLE report
	DROP
		CONSTRAINT FK_member_TO_report
		CASCADE;

ALTER TABLE report
	DROP
		CONSTRAINT FK_board_TO_report
		CASCADE;

ALTER TABLE report
	DROP
		CONSTRAINT FK_report_reason_TO_report
		CASCADE;

ALTER TABLE reply
	DROP
		CONSTRAINT FK_board_TO_reply
		CASCADE;

ALTER TABLE reply
	DROP
		CONSTRAINT FK_member_TO_reply
		CASCADE;

ALTER TABLE follow
	DROP
		CONSTRAINT FK_member_TO_follow
		CASCADE;

ALTER TABLE follow
	DROP
		CONSTRAINT FK_member_TO_follow2
		CASCADE;

ALTER TABLE hash
	DROP
		CONSTRAINT FK_board_TO_hash
		CASCADE;

ALTER TABLE reply_like
	DROP
		CONSTRAINT FK_member_TO_reply_like
		CASCADE;

ALTER TABLE reply_like
	DROP
		CONSTRAINT FK_reply_TO_reply_like
		CASCADE;

ALTER TABLE Notification
	DROP
		CONSTRAINT FK_member_TO_Notification
		CASCADE;

ALTER TABLE FriendNoti
	DROP
		CONSTRAINT FK_member_TO_FriendNoti
		CASCADE;

ALTER TABLE FriendNoti
	DROP
		CONSTRAINT FK_member_TO_FriendNoti2
		CASCADE;

ALTER TABLE FriendNoti
	DROP
		CONSTRAINT FK_Notification_TO_FriendNoti
		CASCADE;

ALTER TABLE LikeNoti
	DROP
		CONSTRAINT FK_member_TO_LikeNoti
		CASCADE;

ALTER TABLE LikeNoti
	DROP
		CONSTRAINT FK_board_TO_LikeNoti
		CASCADE;

ALTER TABLE LikeNoti
	DROP
		CONSTRAINT FK_Notification_TO_LikeNoti
		CASCADE;

ALTER TABLE maybe_friend
	DROP
		CONSTRAINT FK_member_TO_maybe_friend
		CASCADE;

ALTER TABLE maybe_friend
	DROP
		CONSTRAINT FK_member_TO_maybe_friend2
		CASCADE;

ALTER TABLE replyNoti
	DROP
		CONSTRAINT FK_member_TO_replyNoti
		CASCADE;

ALTER TABLE replyNoti
	DROP
		CONSTRAINT FK_Notification_TO_replyNoti
		CASCADE;

ALTER TABLE replyNoti
	DROP
		CONSTRAINT FK_reply_TO_replyNoti
		CASCADE;

ALTER TABLE replyNoti
	DROP
		CONSTRAINT FK_board_TO_replyNoti
		CASCADE;

ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE b_like
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE report
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE report_reason
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE reply
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE reply_like
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Notification
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE FriendNoti
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE LikeNoti
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Notice
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_member;

DROP INDEX PK_board;

DROP INDEX PK_b_like;

DROP INDEX PK_report;

DROP INDEX PK_report_reason;

DROP INDEX PK_reply;

DROP INDEX PK_reply_like;

DROP INDEX PK_Notification;

DROP INDEX PK_FriendNoti;

DROP INDEX PK_LikeNoti;

DROP INDEX PK_Notice;

/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 친구 */
DROP TABLE friend 
	CASCADE CONSTRAINTS;

/* 게시글 */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* 좋아요 */
DROP TABLE b_like 
	CASCADE CONSTRAINTS;

/* 신고 */
DROP TABLE report 
	CASCADE CONSTRAINTS;

/* 신고사유 */
DROP TABLE report_reason 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* 구독 */
DROP TABLE follow 
	CASCADE CONSTRAINTS;

/* 해시태그 */
DROP TABLE hash 
	CASCADE CONSTRAINTS;

/* 댓글좋아요 */
DROP TABLE reply_like 
	CASCADE CONSTRAINTS;

/* 알림 */
DROP TABLE Notification 
	CASCADE CONSTRAINTS;

/* 친구신청알림 */
DROP TABLE FriendNoti 
	CASCADE CONSTRAINTS;

/* 좋아요알림 */
DROP TABLE LikeNoti 
	CASCADE CONSTRAINTS;

/* 공지게시판 */
DROP TABLE Notice 
	CASCADE CONSTRAINTS;

/* 알수도있는친구 */
DROP TABLE maybe_friend 
	CASCADE CONSTRAINTS;

/* 댓글알림 */
DROP TABLE replyNoti 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE member (
	m_num NUMBER(10) NOT NULL, /* 회원번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	password VARCHAR2(100) NOT NULL, /* 비밀번호 */
	name VARCHAR2(100) NOT NULL, /* 성명 */
	birthday DATE NOT NULL, /* 생년월일 */
	type NUMBER(1) DEFAULT 1, /* 회원유형 */
	yellow_card NUMBER(1), /* 경고수 */
	picture VARCHAR2(200), /* 프로필사진 */
	school VARCHAR2(100), /* 고등학교이름 */
	born VARCHAR2(50), /* 출신지 */
	job VARCHAR2(50), /* 직장 */
	job_addr  VARCHAR2(200), /* 직장의위치 */
	job_position  VARCHAR2(200), /* 직장에서직책 */
	school_addr  VARCHAR2(200), /* 학교의위치 */
	job_desc VARCHAR2(400), /* 직장설명 */
	school_into  DATE, /* 고등학교입학일 */
	school_out  DATE, /* 고등학교졸업일 */
	school_desc  VARCHAR2(400), /* 고등학교설명 */
	highschool  VARCHAR2(100), /* 대학교이름 */
	highschool_into  DATE, /* 대학교입학일 */
	highschool_out  DATE, /* 대학교졸업일 */
	highschool_desc  VARCHAR2(400), /* 대학교설명 */
	highschoolmajor  VARCHAR2(100) /* 대학교전공 */
);

COMMENT ON TABLE member IS 'type은 0이면 관리자, 1이면 일반회원, 2이면 블랙리스트
yellow_card는 해당 회원이 작성한 게시물의 신고가 접수(?)되어 관리자에게 경고를 받은 횟수이다';

COMMENT ON COLUMN member.m_num IS '회원번호';

COMMENT ON COLUMN member.email IS '이메일';

COMMENT ON COLUMN member.password IS '비밀번호';

COMMENT ON COLUMN member.name IS '성명';

COMMENT ON COLUMN member.birthday IS '생년월일';

COMMENT ON COLUMN member.type IS '회원유형';

COMMENT ON COLUMN member.yellow_card IS '경고수';

COMMENT ON COLUMN member.picture IS '프로필사진';

COMMENT ON COLUMN member.school IS '고등학교이름';

COMMENT ON COLUMN member.born IS '출신지';

COMMENT ON COLUMN member.job IS '직장';

COMMENT ON COLUMN member.job_addr  IS '직장의위치';

COMMENT ON COLUMN member.job_position  IS '직장에서직책';

COMMENT ON COLUMN member.school_addr  IS '학교의위치';

COMMENT ON COLUMN member.job_desc IS '직장설명';

COMMENT ON COLUMN member.school_into  IS '고등학교입학일';

COMMENT ON COLUMN member.school_out  IS '고등학교졸업일';

COMMENT ON COLUMN member.school_desc  IS '고등학교설명';

COMMENT ON COLUMN member.highschool  IS '대학교이름';

COMMENT ON COLUMN member.highschool_into  IS '대학교입학일';

COMMENT ON COLUMN member.highschool_out  IS '대학교졸업일';

COMMENT ON COLUMN member.highschool_desc  IS '대학교설명';

COMMENT ON COLUMN member.highschoolmajor  IS '대학교전공';

CREATE UNIQUE INDEX PK_member
	ON member (
		m_num ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			m_num
		);

/* 친구 */
CREATE TABLE friend (
	m_num1 NUMBER(10), /* 나 */
	m_num2 NUMBER(10) /* 너 */
);

COMMENT ON TABLE friend IS '친구';

COMMENT ON COLUMN friend.m_num1 IS '나';

COMMENT ON COLUMN friend.m_num2 IS '너';

/* 게시글 */
CREATE TABLE board (
	board_num NUMBER(13) NOT NULL, /* 글번호 */
	m_num NUMBER(10), /* 회원번호 */
	reg_date DATE, /* 시간 */
	open_level NUMBER(1), /* 공개수준 */
	content VARCHAR2(2000), /* 내용 */
	place VARCHAR2(150), /* 장소 */
	picture VARCHAR2(150), /* 사진 */
	video VARCHAR2(150) /* 비디오 */
);

COMMENT ON TABLE board IS '게시글';

COMMENT ON COLUMN board.board_num IS '글번호';

COMMENT ON COLUMN board.m_num IS '회원번호';

COMMENT ON COLUMN board.reg_date IS '시간';

COMMENT ON COLUMN board.open_level IS '공개수준';

COMMENT ON COLUMN board.content IS '내용';

COMMENT ON COLUMN board.place IS '장소';

COMMENT ON COLUMN board.picture IS '사진';

COMMENT ON COLUMN board.video IS '비디오';

CREATE UNIQUE INDEX PK_board
	ON board (
		board_num ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			board_num
		);

/* 좋아요 */
CREATE TABLE b_like (
	board_num NUMBER(13) NOT NULL, /* 글번호 */
	m_num NUMBER(10) NOT NULL, /* 회원번호 */
	like_date DATE /* 시간 */
);

COMMENT ON TABLE b_like IS '좋아요';

COMMENT ON COLUMN b_like.board_num IS '글번호';

COMMENT ON COLUMN b_like.m_num IS '회원번호';

COMMENT ON COLUMN b_like.like_date IS '시간';

CREATE UNIQUE INDEX PK_b_like
	ON b_like (
		board_num ASC,
		m_num ASC
	);

ALTER TABLE b_like
	ADD
		CONSTRAINT PK_b_like
		PRIMARY KEY (
			board_num,
			m_num
		);

/* 신고 */
CREATE TABLE report (
	report_num NUMBER(10) NOT NULL, /* 신고번호 */
	m_num NUMBER(10), /* 회원번호 */
	board_num NUMBER(13), /* 글번호 */
	report_code NUMBER(10), /* 신고코드 */
	report_date DATE, /* 신고일자 */
	reason VARCHAR2(150) /* 신고사유 */
);

COMMENT ON TABLE report IS '신고';

COMMENT ON COLUMN report.report_num IS '신고번호';

COMMENT ON COLUMN report.m_num IS '회원번호';

COMMENT ON COLUMN report.board_num IS '글번호';

COMMENT ON COLUMN report.report_code IS '신고코드';

COMMENT ON COLUMN report.report_date IS '신고일자';

COMMENT ON COLUMN report.reason IS '신고사유';

CREATE UNIQUE INDEX PK_report
	ON report (
		report_num ASC
	);

ALTER TABLE report
	ADD
		CONSTRAINT PK_report
		PRIMARY KEY (
			report_num
		);

/* 신고사유 */
CREATE TABLE report_reason (
	report_code NUMBER(10) NOT NULL, /* 신고코드 */
	report_detail VARCHAR2(150) /* 신고내용 */
);

COMMENT ON TABLE report_reason IS '신고사유';

COMMENT ON COLUMN report_reason.report_code IS '신고코드';

COMMENT ON COLUMN report_reason.report_detail IS '신고내용';

CREATE UNIQUE INDEX PK_report_reason
	ON report_reason (
		report_code ASC
	);

ALTER TABLE report_reason
	ADD
		CONSTRAINT PK_report_reason
		PRIMARY KEY (
			report_code
		);

/* 댓글 */
CREATE TABLE reply (
	reply_num NUMBER(13) NOT NULL, /* 댓글번호 */
	board_num NUMBER(13), /* 글번호 */
	m_num NUMBER(10), /* 댓글작성자 */
	parent_reply NUMBER(13), /* 부모댓글번호 */
	r_date DATE, /* 시간 */
	r_content VARCHAR2(1000) /* 댓글내용 */
);

COMMENT ON TABLE reply IS '댓글';

COMMENT ON COLUMN reply.reply_num IS '댓글번호';

COMMENT ON COLUMN reply.board_num IS '글번호';

COMMENT ON COLUMN reply.m_num IS '댓글작성자';

COMMENT ON COLUMN reply.parent_reply IS '부모댓글번호';

COMMENT ON COLUMN reply.r_date IS '시간';

COMMENT ON COLUMN reply.r_content IS '댓글내용';

CREATE UNIQUE INDEX PK_reply
	ON reply (
		reply_num ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_num
		);

/* 구독 */
CREATE TABLE follow (
	follower NUMBER(10), /* 회원번호 */
	following NUMBER(10) /* 회원번호2 */
);

COMMENT ON TABLE follow IS '구독';

COMMENT ON COLUMN follow.follower IS '회원번호';

COMMENT ON COLUMN follow.following IS '회원번호2';

/* 해시태그 */
CREATE TABLE hash (
	hash_code VARCHAR2(150), /* 해시코드 */
	board_num NUMBER(13) /* 게시글번호 */
);

COMMENT ON TABLE hash IS '해시태그';

COMMENT ON COLUMN hash.hash_code IS '해시코드';

COMMENT ON COLUMN hash.board_num IS '게시글번호';

/* 댓글좋아요 */
CREATE TABLE reply_like (
	reply_num NUMBER(13) NOT NULL, /* 댓글번호 */
	m_num NUMBER(10) NOT NULL /* 회원번호 */
);

COMMENT ON TABLE reply_like IS '댓글좋아요';

COMMENT ON COLUMN reply_like.reply_num IS '댓글번호';

COMMENT ON COLUMN reply_like.m_num IS '회원번호';

CREATE UNIQUE INDEX PK_reply_like
	ON reply_like (
		reply_num ASC,
		m_num ASC
	);

ALTER TABLE reply_like
	ADD
		CONSTRAINT PK_reply_like
		PRIMARY KEY (
			reply_num,
			m_num
		);

/* 알림 */
CREATE TABLE Notification (
	noti_num NUMBER(10) NOT NULL, /* 알림번호 */
	m_num NUMBER(10), /* 회원번호 */
	read number(1) DEFAULT 0, /* 확인여부 */
	noti_date DATE, /* 발생일자 */
	noti_type NUMBER(1) /* 알림종류 */
);

COMMENT ON TABLE Notification IS '알림';

COMMENT ON COLUMN Notification.noti_num IS '알림번호';

COMMENT ON COLUMN Notification.m_num IS '회원번호';

COMMENT ON COLUMN Notification.read IS '확인여부';

COMMENT ON COLUMN Notification.noti_date IS '발생일자';

COMMENT ON COLUMN Notification.noti_type IS '알림종류';

CREATE UNIQUE INDEX PK_Notification
	ON Notification (
		noti_num ASC
	);

ALTER TABLE Notification
	ADD
		CONSTRAINT PK_Notification
		PRIMARY KEY (
			noti_num
		);

/* 친구신청알림 */
CREATE TABLE FriendNoti (
	noti_num NUMBER(10) NOT NULL, /* 알림번호 */
	m_num NUMBER(10), /* 내회원번호 */
	f_num NUMBER(10), /* 친구회원번호 */
	accept NUMBER(1) /* 신청수락 */
);

COMMENT ON TABLE FriendNoti IS '친구신청알림';

COMMENT ON COLUMN FriendNoti.noti_num IS '알림번호';

COMMENT ON COLUMN FriendNoti.m_num IS '내회원번호';

COMMENT ON COLUMN FriendNoti.f_num IS '친구회원번호';

COMMENT ON COLUMN FriendNoti.accept IS '신청수락';

CREATE UNIQUE INDEX PK_FriendNoti
	ON FriendNoti (
		noti_num ASC
	);

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT PK_FriendNoti
		PRIMARY KEY (
			noti_num
		);

/* 좋아요알림 */
CREATE TABLE LikeNoti (
	noti_num NUMBER(10) NOT NULL, /* 새 컬럼 */
	m_num NUMBER(10) NOT NULL, /* 회원번호 */
	board_num NUMBER(13) NOT NULL /* 게시글번호 */
);

COMMENT ON TABLE LikeNoti IS '좋아요알림';

COMMENT ON COLUMN LikeNoti.noti_num IS '새 컬럼';

COMMENT ON COLUMN LikeNoti.m_num IS '회원번호';

COMMENT ON COLUMN LikeNoti.board_num IS '게시글번호';

CREATE UNIQUE INDEX PK_LikeNoti
	ON LikeNoti (
		noti_num ASC
	);

ALTER TABLE LikeNoti
	ADD
		CONSTRAINT PK_LikeNoti
		PRIMARY KEY (
			noti_num
		);

/* 공지게시판 */
CREATE TABLE Notice (
	notice_num NUMBER(10) NOT NULL, /* 공지번호 */
	write_date DATE DEFAULT sysdate NOT NULL, /* 작성일 */
	notice_hit NUMBER(10) NOT NULL, /* 조회수 */
	notice_title VARCHAR2(100) NOT NULL, /* 제목 */
	notice_contents VARCHAR2(500) NOT NULL /* 내용 */
);

COMMENT ON TABLE Notice IS '공지게시판';

COMMENT ON COLUMN Notice.notice_num IS '공지번호';

COMMENT ON COLUMN Notice.write_date IS '작성일';

COMMENT ON COLUMN Notice.notice_hit IS '조회수';

COMMENT ON COLUMN Notice.notice_title IS '제목';

COMMENT ON COLUMN Notice.notice_contents IS '내용';

CREATE UNIQUE INDEX PK_Notice
	ON Notice (
		notice_num ASC
	);

ALTER TABLE Notice
	ADD
		CONSTRAINT PK_Notice
		PRIMARY KEY (
			notice_num
		);

/* 알수도있는친구 */
CREATE TABLE maybe_friend (
	myId NUMBER(10), /* 내아이디 */
	maybe_friendId NUMBER(10), /* 알수도있는친구아이디 */
	together_friendID varchar2(500), /* 함께아는친구아이디 */
	score number,, /* 점수 */
	reson varchar2(400), /* 이유 */
	m_num NUMBER(10) /* 회원번호 */
);

COMMENT ON TABLE maybe_friend IS '알수도있는친구';

COMMENT ON COLUMN maybe_friend.myId IS '내아이디';

COMMENT ON COLUMN maybe_friend.maybe_friendId IS '알수도있는친구아이디';

COMMENT ON COLUMN maybe_friend.together_friendID IS '함께아는친구아이디';

COMMENT ON COLUMN maybe_friend.score IS '점수';

COMMENT ON COLUMN maybe_friend.reson IS '이유';

COMMENT ON COLUMN maybe_friend.m_num IS '회원번호';

/* 댓글알림 */
CREATE TABLE replyNoti (
	noti_num NUMBER(10), /* 알림번호 */
	m_num NUMBER(10), /* 회원번호 */
	reply_num NUMBER(13), /* 댓글번호 */
	board_num NUMBER(13) /* 게시판번호 */
);

COMMENT ON TABLE replyNoti IS '댓글알림';

COMMENT ON COLUMN replyNoti.noti_num IS '알림번호';

COMMENT ON COLUMN replyNoti.m_num IS '회원번호';

COMMENT ON COLUMN replyNoti.reply_num IS '댓글번호';

COMMENT ON COLUMN replyNoti.board_num IS '게시판번호';

ALTER TABLE friend
	ADD
		CONSTRAINT FK_member_TO_friend
		FOREIGN KEY (
			m_num1
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE friend
	ADD
		CONSTRAINT FK_member_TO_friend2
		FOREIGN KEY (
			m_num2
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE b_like
	ADD
		CONSTRAINT FK_member_TO_b_like
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE b_like
	ADD
		CONSTRAINT FK_board_TO_b_like
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		)
		ON DELETE CASCADE;

ALTER TABLE report
	ADD
		CONSTRAINT FK_member_TO_report
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_board_TO_report
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_report_reason_TO_report
		FOREIGN KEY (
			report_code
		)
		REFERENCES report_reason (
			report_code
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		)
		ON DELETE CASCADE;

ALTER TABLE reply
	ADD
		CONSTRAINT FK_member_TO_reply
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE follow
	ADD
		CONSTRAINT FK_member_TO_follow
		FOREIGN KEY (
			follower
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE follow
	ADD
		CONSTRAINT FK_member_TO_follow2
		FOREIGN KEY (
			following
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE hash
	ADD
		CONSTRAINT FK_board_TO_hash
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		)
		ON DELETE CASCADE;

ALTER TABLE reply_like
	ADD
		CONSTRAINT FK_member_TO_reply_like
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE reply_like
	ADD
		CONSTRAINT FK_reply_TO_reply_like
		FOREIGN KEY (
			reply_num
		)
		REFERENCES reply (
			reply_num
		)
		ON DELETE CASCADE;

ALTER TABLE Notification
	ADD
		CONSTRAINT FK_member_TO_Notification
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT FK_member_TO_FriendNoti
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT FK_member_TO_FriendNoti2
		FOREIGN KEY (
			f_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT FK_Notification_TO_FriendNoti
		FOREIGN KEY (
			noti_num
		)
		REFERENCES Notification (
			noti_num
		)
		ON DELETE CASCADE;

ALTER TABLE LikeNoti
	ADD
		CONSTRAINT FK_member_TO_LikeNoti
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE LikeNoti
	ADD
		CONSTRAINT FK_board_TO_LikeNoti
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		)
		ON DELETE CASCADE;

ALTER TABLE LikeNoti
	ADD
		CONSTRAINT FK_Notification_TO_LikeNoti
		FOREIGN KEY (
			noti_num
		)
		REFERENCES Notification (
			noti_num
		)
		ON DELETE CASCADE;

ALTER TABLE maybe_friend
	ADD
		CONSTRAINT FK_member_TO_maybe_friend
		FOREIGN KEY (
			myId
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE maybe_friend
	ADD
		CONSTRAINT FK_member_TO_maybe_friend2
		FOREIGN KEY (
			maybe_friendId
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE replyNoti
	ADD
		CONSTRAINT FK_member_TO_replyNoti
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		)
		ON DELETE CASCADE;

ALTER TABLE replyNoti
	ADD
		CONSTRAINT FK_Notification_TO_replyNoti
		FOREIGN KEY (
			noti_num
		)
		REFERENCES Notification (
			noti_num
		)
		ON DELETE CASCADE;

ALTER TABLE replyNoti
	ADD
		CONSTRAINT FK_reply_TO_replyNoti
		FOREIGN KEY (
			reply_num
		)
		REFERENCES reply (
			reply_num
		)
		ON DELETE CASCADE;

ALTER TABLE replyNoti
	ADD
		CONSTRAINT FK_board_TO_replyNoti
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		)
		ON DELETE CASCADE;