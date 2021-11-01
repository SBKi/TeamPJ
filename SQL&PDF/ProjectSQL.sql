create table member(
	member_id varchar(20) primary key,
	member_password varchar(20) not null,
	member_name varchar(10) not null,
	member_img1 varchar(50),
	member_tel varchar(13) not null,
	member_email varchar(50) not null,
	member_address varchar(50) not null 
);

create table product(
	product_no int auto_increment primary key,
	product_category varchar(30) not null,	-- fk 
	product_name varchar(100) not null,
	product_content varchar(300) not null,
	product_price int not null,
	product_img1 varchar(50) not null,
	product_img2 varchar(50),
	product_img3 varchar(50),
	product_seller varchar(20) not null,  -- fk
	product_buyer varchar(20),			-- fk
	product_like int default(0),
	product_status varchar(5) default 'ing',
	product_date datetime default CURRENT_TIMESTAMP,
	product_readcount int default(0),
	product_done_date datetime
);

create table category(
	category_no int primary key,
	category_name varchar(30) not null unique key
);

create table favorites(
	favorites_no int auto_increment primary key,
	favorites_product_no int, -- fk
	favorites_member_id varchar(20) -- fk
);

create table mail(
   mail_no int auto_increment primary key,
   mail_room varchar(60) not null,
   mail_product_no int not null, -- fk
   mail_content varchar(50) not null,
   mail_sendid varchar(20), -- fk
   mail_postid varchar(20), -- fk
   mail_date datetime default current_timestamp,
   constraint m_sendfk foreign key(mail_sendid) references member(member_id) on delete cascade on update cascade,
   constraint m_postfk foreign key(mail_postid) references member(member_id) on delete cascade on update cascade,
   constraint m_product foreign key(mail_product_no) references product(product_no) on delete cascade on update cascade
);

create table declaration(
   declration_no int auto_increment primary key,
   declration_id varchar(20) not null,
   declration_product_no int not null,
   declration_comment varchar(300),
   constraint d_id foreign key(declration_id) references member(member_id) on delete cascade on update cascade,
   constraint d_pno foreign key(declration_product_no) references product(product_no) on delete cascade on update cascade
);

alter table product ADD check (product_status in('ing', 'done'));
ALTER TABLE product ADD FOREIGN KEY (product_category) REFERENCES category(category_name);
ALTER TABLE product ADD FOREIGN KEY (product_seller) REFERENCES member(member_id);
ALTER TABLE product ADD FOREIGN KEY (product_buyer) REFERENCES member(member_id);
ALTER TABLE favorites ADD FOREIGN KEY (favorites_product_no) REFERENCES product(product_no);
ALTER TABLE favorites ADD FOREIGN KEY (favorites_member_id) REFERENCES  member(member_id);
ALTER TABLE mail ADD FOREIGN KEY (mail_sendid) REFERENCES member(member_id);
ALTER TABLE mail ADD FOREIGN KEY (mail_postid) REFERENCES member(member_id);
ALTER TABLE mail ADD FOREIGN KEY (mail_product_no) REFERENCES  product(product_no);
ALTER TABLE favorites ADD FOREIGN KEY (favorites_member_id) REFERENCES  member(member_id)on delete cascade on update cascade;
ALTER TABLE favorites ADD FOREIGN KEY (favorites_product_no) REFERENCES product(product_no)on delete cascade on update cascade;
ALTER TABLE mail ADD mail_status TINYINT DEFAULT 1 NOT NULL;
ALTER TABLE member ADD member_status TINYINT DEFAULT 0 NOT NULL;
ALTER TABLE category MODIFY COLUMN category_no int auto_increment NOT NULL;

insert into category (category_name) values ('스포츠');
insert into category (category_name) values ('뷰티');
insert into category (category_name) values ('여성의류');
insert into category (category_name) values ('남성의류');
insert into category (category_name) values ('패션잡화');
insert into category (category_name) values ('휴대폰');
insert into category (category_name) values ('컴퓨터');
insert into category (category_name) values ('카메라');
insert into category (category_name) values ('디지털가전');
insert into category (category_name) values ('가구');
insert into category (category_name) values ('생활');
insert into category (category_name) values ('도서');
insert into category (category_name) values ('문구');
insert into category (category_name) values ('반려동물용품');
insert into category (category_name) values ('기타');


-- 계정 등록
insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('gildong12', '12345678', '김길동', 'person1.png','01023456879', 'gildong@naver.com','서울시 성동구 가람길 46');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('happygirl1', '34567894', '최행복', 'person2.png','01046578654', 'happiness@naver.com','서울시 강남구 테헤란로 107');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('kd1234', '98765432', '박경덕', 'person3.png','01056235612', 'gildong@naver.com','서울시 서초구 반포대로1길 8');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('sujin25', '45678912', '김수진', 'person4.png','01066421252', 'sujin45@naver.com', '서울시 경교장길 5');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('injik2222', '22222222', '김인직', 'person5.png','01034567784', 'gamst10@naver.com', '서울시 강서구 가로공원로 173');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('cheeze123', '12345678', '임준영','person6.png','01055667788', 'cheeze123@naver.com', '서울시 강동구 성안로3길 121');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('landing', '12345678', '김주일','person7.png','01044556677', 'landing@naver.com', '서울시 송파구 잠실본동 237-10');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('lala27', '12345678', '임라라','person8.png','01033445566','lala27@naver.com', '춘천 장학리 648-10');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email ,member_address)
values ('lice123', '12345678', '허진석','person9.png','01022334455', 'lice123@naver.com', '춘천 교동 158-69');

insert into member (member_id,member_password,
member_name,member_img1,member_tel,member_email,member_address)
values('suckman95','12345678','이민석','person10.png','01011223344','suckman95@naver.com','서울시 송파구 풍성로 13');

-- 상품 등록

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('생활', '5kg 아령 판매합니다.', '증량성공으로 5kg가 필요없어졌네요. 데려가세요', '15000','5kg.png','gildong12');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('휴대폰', 'z플립 판매합니다.', '미개봉 상품입니다. 색상이 맘에 안들어서 판매해요.', '990000','z플립.png','gildong12');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('남성의류', '남성 가디건 판매합니다.', '사이즈 미스로 판매해요.', '35000','가디건.PNG','gildong12');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('생활', '고구마 10kg 판매해요.', '신품종 고구마 판매해요. 쿨거래하시면 사이다도 같이 드립니다..', '50000','고구마10kg.png','gildong12');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('생활', '고칼슘 두유 팔아요', '아침대용으로 좋은 두유 판매해요. 개당 천원입니다.', '1000','고칼슘두유.png','gildong12');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('도서', 'GitHub 입문자용 책 판매해요.', '하도 많이 봐서 다 외웠네요. 직거래만 합니다.', '15000','깃허브책.png','happygirl1');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('문구', '노트 팔아요.', '공부할 마음이 없어서 사두었던 노트 급처해요 권당 오백원이요.', '500','노트.png','happygirl1');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('스포츠', '농구공 판매합니다..', '선물받았는데 사용할 일 이 없어서 판매합니다..', '5000','농구공.PNG','happygirl1');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('뷰티', '닥터지 수분크림 판매해요.', 'px에서 대량으로 쟁여놨는데 피부가 너무 좋아져서 판매합니다.', '12000','닥터지 수분크림.PNG','happygirl1');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '마르지엘라 독일군 뮬 판매합니다.', '2번신었는데 사이즈가 안맞는거 같아서 판매해요. 얼른 데려가세요.', '350000','독일군.png','happygirl1');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '디올 카드지갑 판매합니다.', '다른 지갑을 선물받아서 판매합니다. 사용횟수 몇번 안됩니다.', '500000','디올카드지갑.png','kd1234');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '라카이코리아 운동화 판매해요.', '사이즈가 안맞아서 급하게 내놓습니다. 귀한 물건이에요..', '100000','라카이코리아.jpg','kd1234');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('기타', '레드킹 기프티콘 판매합니다.', '생일선물로 받은건데 닭고기 알레르기가 있어서 판매해요..얼른 가져가세요.', '18000','레드킹.PNG','kd1234');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('기타', '[무료나눔]시원한 아이스티 한잔하세요.', '아이스티에 진심이신분들 목마른분들 동네 주민이면 그냥 가져가세요.', '1','립톤아이스티.png','kd1234');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('뷰티', '마스크팩 50장 판매합니다..', '꿀피부가 되고 싶은신분들께 추천드립니다요..장당 500원이요 비싼거에요', '500','마스크팩.PNG','kd1234');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('컴퓨터', '맥 신상 팝니다..', '한번도 사용안했구요 다른 컴퓨터가 더 맘에들어서 판매합니다.', '2000000','맥.png','sujin25');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('기타', '맵스터 기프티콘 판매해요.', '너무 매워서 화장실 갈거같애서 저는 못먹을거같아요.. 정가보다 낮게 내놓습니다..', '15000','맵스터.PNG','sujin25');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('뷰티', '메디큐브크림 팝니다.', '두번 사용했구요 제 피부랑은 안맞는 것 같아서 판매합니다.', '20000','메디큐브크림.png','sujin25');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('생활', '모두의 마블 매트 팔아요.', '배스킨라빈스 한정판 모두의 마블 매트입니다. 휴대하기도 간편하고 그냥 매트로도 쓰실  수 있어요.', '20000','모두의마블.png','sujin25');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('생활', '미니 휴대용 선풍기 판매합니다..', '새건데 저는 좀 유치해서 못쓰겠네요..어린이 분들께 추천드립니다.', '10000','미니선풍기.png','sujin25');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '발렌시아가 링 팔아요..', '손가락에 살이쪄서 안맞습니다. 20호구요 싸게 내놓습니다.', '200000','반지.png','injik2222');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('남성의류', '귀여운 캐릭터 반팔 판매해요.', '여름끝나서 판매해요. 내년여름을 대비해보세요 ! ', '20000','반팔티.png','injik2222');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '발렌시아가 미니백 팝니다..', '신상가방 사느라 돈이 필요해서 판매해요. 데려가실분 데려가세요.', '900000','발렌가방.png','injik2222');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('생활', '비데 배송부터 설치까지 해드립니다..', '비데 설치 전문 업체 깨끄시 입니다.연락주시면 24시간안에 배송 및 설치까지 완료해드립니다.', '200000','비데.png','injik2222');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '샤넬 지갑팔아요.', '선물 받은건데 돈이 급해서 판매해요. 작고 소중한 아이 데려가세요.', '1000000','샤넬장지갑.png','injik2222');

insert into product 
(product_category,product_name,product_content,product_price,product_img1,product_seller)
values ('패션잡화', '손목시계 판매합니다. ', '찐이구요 가품은 취급안합니다. 얼른 가져가세요.','500000','손목시계.png','injik2222');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('생활', '휴대용 가위 팔아요', '필요가 없어져서 팔아요.','5000','휴대용가위.png','suckman95');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '황금올리브 쿠폰', '황금올리브에 진심인 분께 팔아요','18000','황금올리브.PNG','lice123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('생활', '황금보따리', '황금색 보따리 싸게 가져가세요','5000','황금보따리.png','lala27');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('문구', '당근 형광펜', '아이들이 좋아하는 당근 형광펜을 아이한테 선물해 주세요','8000','형광펜.png','landing');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('뷰티', '피지흡입기', '피지가 고민이신 분들에게 안성맞춤 아이템','15000','피지흡입기.png','cheeze123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('남성의류', '프레디페리 남성 신발', '신상으로 나온 프레디페리 신발 선물받은거 팔아요', '90000','프레디페리.png','suckman95');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('스포츠', '홈트 풀업바', '홈트하시는 분들 싸게 가져가세요', '20000','풀업바.png','lice123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '파주 도너츠', '파주 도너츠를 파주에서 대량으로 판매하고 있습니다.', '10000','파주도너츠.png','lala27');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '커피 땅콩', '술안주로 제격인 커피땅콩 싸게 팔아요.', '5000','커피땅콩.png','landing');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('카메라', '신형 소니 카메라', '신형 소니 카메라 일주일 쓴거 팔아요. 하자 없음.', '300000','카메라.png','cheeze123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '치즐링 쿠폰', '비비큐 치즐링 쿠폰 팝니다.', '18000','치즐링.PNG','cheeze123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('디지털가전', '체중계', '내년엔 꼭 살을 빼 봅시다', '15000','체중계.png','landing');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('도서', '간편한 책장', '심플하게 디자인 된 책장. 이사가는데 버리긴 아까워서 팔아요', '20000','책장.png','lala27');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('생활', '착즙기', '집에서 간편하게 디톡스음료 만들어보아요', '50000','착즙기.png','lice123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '자전거모형', '집에 인테리어로 딱인 자전거 모형', '40000','자전거모형.png','suckman95');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '인형', '잘 때 끌어안고 자면 편한 인형', '5000','인형.png','lala27');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('스포츠', '푹신한 요가매트', '홈트할 때 층간소음 걱정 no', '10000','요가매트.PNG','landing');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('휴대폰', '에어팟케이스', '에어팟을 좀 더 이쁘고 안전하게 꾸며보세요', '10000','에어팟케이스.png','lice123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('디지털가전', '에어컨 리모콘', '어떤 에어컨이든 다 연결이 되는 만능 리모콘', '20000','에어컨리모컨.png','cheeze123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '얼큰한 순두부찌개', '[무료나눔] 저희 가게에서 이벤트를 합니다. 선착순 30명을 대상으로 무료로 얼큰순두부찌개를 드려요', '0','얼큰순두부찌개.png','lice123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('디지털가전', '애플워치', '산지 한달된 애플워치 급처합니다.', '60000','애플워치.png','suckman95');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('반려동물용품', '강아지 사료', '믿고 먹일 수 있는 강아지 사료에요.', '30000','애견용품.png','lala27');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('남성의류', '아미후드티', '아미 가을 신상 후드티 판매합니다. 한번입었어요.', '350000','아미후드티.png','lice123');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('생활', '스타벅스에서 받은 텀블러', '스타벅스 한정판 텀블러입니다.', '25000','스벅텀블러.png','landing');

insert into product
(product_category,product_name,product_content,product_price,product_img1,product_seller) 
values ('기타', '직접 만든 수제케이크', '[무료나눔]심심해서 만들어봤어요. 우리 같이 먹어요', '0','수제케이크.png','lice123');