# -*- coding: utf-8 -*-
import pygame

pygame.init() # 초기화 (반드시 필요)

# 화면 크기 설정
screen_width = 480 # 가로 크기
screen_height = 640 # 세로 크기

screen = pygame.display.set_mode((screen_width, screen_height))

# 화면 타이틀(제목) 설정
pygame.display.set_caption("Test Game") #게임 이름

# FPS 초당 프레임 변수 설정
clock = pygame.time.Clock()

# 배경 이미지 불러오기
background = pygame.image.load("./background.png")
background = pygame.transform.scale(background, (screen_width, screen_height))

# 캐릭터 불러오기
character = pygame.image.load("./character.png")
character = pygame.transform.scale(character, (40, 40))

character_size = character.get_rect().size # 캐릭터의 사이즈 가져오기
character_width = character_size[0] # 캐릭터의 가로 크기
character_height = character_size[1] # 캐릭터의 세로 크기
character_x_position = (screen_width / 2) - (character_width / 2) # 화면 가로에 중간지점에 캐릭터의 가로 위치
character_y_position = screen_height - character_height # 화면 세로 크기 가장 아래에 캐릭터의 세로 위치

# 이동할 좌표
to_x = 0
to_y = 0

# 이동 속도
character_speed = 0.5

# FPS
FPS = 30


#pygame에서는 이벤트 루프가 있어야 창이 꺼지지않음
# 이벤트 루프
running = True # 게임이 진행중인지 확인하기
while running:
    dt = clock.tick(FPS) # 게임화면의 초당 프레임 수 설정

    print("fps : " + str(clock.get_fps())) #프레임 수 확인

    for event in pygame.event.get(): # running 중 키보드나,마우스 입력값(이벤트)을 체크해주는것
        if event.type == pygame.QUIT: # 창이 닫히는 이벤트가 발생하였는지
            running = False # 게임이 진행중이 아님

        if event.type == pygame.KEYDOWN: #키가 눌러졌는지 확인
            if event.key == pygame.K_LEFT: # 캐릭터를 왼쪽으로
                to_x -= character_speed # -5만큼
            elif event.key == pygame.K_RIGHT: # 캐릭터를 오른쪽으로
                to_x += character_speed
            elif event.key == pygame.K_UP: # 캐릭터를 위로
                to_y -= character_speed
            elif event.key == pygame.K_DOWN: # 캐릭터를 아래로
                to_y += character_speed

        if event.type == pygame.KEYUP: # 방향키를 떼면 멈춤
            if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                to_x = 0
            elif event.key == pygame.K_UP or event.key == pygame.K_DOWN:
                to_y = 0


    #screen.fill((0, 0, 255)) #RGB형식으로 이미지 로드
    screen.blit(background, (0, 0)) # 배경 그리기(background 가 표시되는 위치)

    screen.blit(character, (character_x_position, character_y_position)) # 캐릭터 그리기

    character_x_position += to_x * dt # 캐릭터의 포지션을 x만큼 실제 움직임 프레임수(dt)만큼 곱해서
    character_y_position += to_y * dt # 캐릭터의 포지션을 x만큼 실제 움직임

    # X 경계값 설정
    if character_x_position < 0:
        character_x_position = 0
    elif character_x_position > screen_width - character_width:
        character_x_position = screen_width - character_width
    # Y 경계값 설정
    if character_y_position < 0 :
        character_y_position= 0
    elif character_y_position > screen_height - character_height:
        character_y_position = screen_height - character_height

    pygame.display.update() # 게임화면을 지속적으로 그리기(for 문도는동안 계속)

# pygame 종료
pygame.quit()