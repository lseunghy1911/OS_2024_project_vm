
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 24                	jle    41 <main+0x41>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 33                	pushl  (%ebx)
  2d:	83 c3 04             	add    $0x4,%ebx
  30:	e8 cb 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  35:	83 c4 10             	add    $0x10,%esp
  38:	39 f3                	cmp    %esi,%ebx
  3a:	75 ec                	jne    28 <main+0x28>
  exit();
  3c:	e8 52 05 00 00       	call   593 <exit>
    ls(".");
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	68 fc 0b 00 00       	push   $0xbfc
  49:	e8 b2 00 00 00       	call   100 <ls>
    exit();
  4e:	e8 40 05 00 00       	call   593 <exit>
  53:	66 90                	xchg   %ax,%ax
  55:	66 90                	xchg   %ax,%ax
  57:	66 90                	xchg   %ax,%ax
  59:	66 90                	xchg   %ax,%ax
  5b:	66 90                	xchg   %ax,%ax
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 4f 03 00 00       	call   3c0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 d0 0f 00 00       	push   $0xfd0
  b5:	e8 a6 04 00 00       	call   560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb d0 0f 00 00       	mov    $0xfd0,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 d0 0f 00 00       	add    $0xfd0,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 07 03 00 00       	call   3f0 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 bc 04 00 00       	call   5d3 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 b7 04 00 00       	call   5eb <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 60 04 00 00       	call   5bb <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d 76 00             	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 dc 0b 00 00       	push   $0xbdc
 19d:	6a 01                	push   $0x1
 19f:	e8 4c 05 00 00       	call   6f0 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 99 03 00 00       	call   5ab <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 23a:	e8 21 03 00 00       	call   560 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 7e 02 00 00       	call   4d0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 dc 0b 00 00       	push   $0xbdc
 2a7:	6a 01                	push   $0x1
 2a9:	e8 42 04 00 00       	call   6f0 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d 76 00             	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 b4 0b 00 00       	push   $0xbb4
 2c9:	6a 02                	push   $0x2
 2cb:	e8 20 04 00 00       	call   6f0 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	90                   	nop
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 e9 0b 00 00       	push   $0xbe9
 2e8:	6a 01                	push   $0x1
 2ea:	e8 01 04 00 00       	call   6f0 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 c8 0b 00 00       	push   $0xbc8
 309:	6a 02                	push   $0x2
 30b:	e8 e0 03 00 00       	call   6f0 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 a3 02 00 00       	call   5bb <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	90                   	nop
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 c8 0b 00 00       	push   $0xbc8
 331:	6a 01                	push   $0x1
 333:	e8 b8 03 00 00       	call   6f0 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 c0                	xor    %eax,%eax
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 4d 08             	mov    0x8(%ebp),%ecx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	89 c8                	mov    %ecx,%eax
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 4d 08             	mov    0x8(%ebp),%ecx
 377:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37a:	0f b6 01             	movzbl (%ecx),%eax
 37d:	0f b6 1a             	movzbl (%edx),%ebx
 380:	84 c0                	test   %al,%al
 382:	75 1d                	jne    3a1 <strcmp+0x31>
 384:	eb 2a                	jmp    3b0 <strcmp+0x40>
 386:	8d 76 00             	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 1a             	movzbl (%edx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	5b                   	pop    %ebx
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	89 f6                	mov    %esi,%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3c6:	80 3a 00             	cmpb   $0x0,(%edx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c0 01             	add    $0x1,%eax
 3d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3d7:	89 c1                	mov    %eax,%ecx
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
 3db:	89 c8                	mov    %ecx,%eax
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
 3df:	90                   	nop
  for(n = 0; s[n]; n++)
 3e0:	31 c9                	xor    %ecx,%ecx
}
 3e2:	5d                   	pop    %ebp
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	c3                   	ret    
 3e6:	8d 76 00             	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld    
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	89 d0                	mov    %edx,%eax
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 41a:	0f b6 10             	movzbl (%eax),%edx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 12                	jne    433 <strchr+0x23>
 421:	eb 1d                	jmp    440 <strchr+0x30>
 423:	90                   	nop
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 428:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 42c:	83 c0 01             	add    $0x1,%eax
 42f:	84 d2                	test   %dl,%dl
 431:	74 0d                	je     440 <strchr+0x30>
    if(*s == c)
 433:	38 d1                	cmp    %dl,%cl
 435:	75 f1                	jne    428 <strchr+0x18>
      return (char*)s;
  return 0;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 44a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 455:	31 f6                	xor    %esi,%esi
{
 457:	53                   	push   %ebx
 458:	89 f3                	mov    %esi,%ebx
 45a:	83 ec 1c             	sub    $0x1c,%esp
 45d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 460:	eb 2f                	jmp    491 <gets+0x41>
 462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 468:	83 ec 04             	sub    $0x4,%esp
 46b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 46e:	6a 01                	push   $0x1
 470:	50                   	push   %eax
 471:	6a 00                	push   $0x0
 473:	e8 33 01 00 00       	call   5ab <read>
    if(cc < 1)
 478:	83 c4 10             	add    $0x10,%esp
 47b:	85 c0                	test   %eax,%eax
 47d:	7e 1c                	jle    49b <gets+0x4b>
      break;
    buf[i++] = c;
 47f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 483:	83 c7 01             	add    $0x1,%edi
 486:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 489:	3c 0a                	cmp    $0xa,%al
 48b:	74 23                	je     4b0 <gets+0x60>
 48d:	3c 0d                	cmp    $0xd,%al
 48f:	74 1f                	je     4b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 491:	83 c3 01             	add    $0x1,%ebx
 494:	89 fe                	mov    %edi,%esi
 496:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 499:	7c cd                	jl     468 <gets+0x18>
 49b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret    
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b0:	8b 75 08             	mov    0x8(%ebp),%esi
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	01 de                	add    %ebx,%esi
 4b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c0:	5b                   	pop    %ebx
 4c1:	5e                   	pop    %esi
 4c2:	5f                   	pop    %edi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    
 4c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	pushl  0x8(%ebp)
 4dd:	e8 f1 00 00 00       	call   5d3 <open>
  if(fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	pushl  0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 f4 00 00 00       	call   5eb <fstat>
  close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
  close(fd);
 4fc:	e8 ba 00 00 00       	call   5bb <close>
  return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 527:	0f be 02             	movsbl (%edx),%eax
 52a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 52d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 535:	77 1e                	ja     555 <atoi+0x35>
 537:	89 f6                	mov    %esi,%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 540:	83 c2 01             	add    $0x1,%edx
 543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 54a:	0f be 02             	movsbl (%edx),%eax
 54d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
  return n;
}
 555:	89 c8                	mov    %ecx,%eax
 557:	5b                   	pop    %ebx
 558:	5d                   	pop    %ebp
 559:	c3                   	ret    
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 45 10             	mov    0x10(%ebp),%eax
 567:	8b 55 08             	mov    0x8(%ebp),%edx
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56e:	85 c0                	test   %eax,%eax
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 d0                	add    %edx,%eax
  dst = vdst;
 574:	89 d7                	mov    %edx,%edi
 576:	8d 76 00             	lea    0x0(%esi),%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 581:	39 f8                	cmp    %edi,%eax
 583:	75 fb                	jne    580 <memmove+0x20>
  return vdst;
}
 585:	5e                   	pop    %esi
 586:	89 d0                	mov    %edx,%eax
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    

0000058b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58b:	b8 01 00 00 00       	mov    $0x1,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <exit>:
SYSCALL(exit)
 593:	b8 02 00 00 00       	mov    $0x2,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <wait>:
SYSCALL(wait)
 59b:	b8 03 00 00 00       	mov    $0x3,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <pipe>:
SYSCALL(pipe)
 5a3:	b8 04 00 00 00       	mov    $0x4,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <read>:
SYSCALL(read)
 5ab:	b8 05 00 00 00       	mov    $0x5,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <write>:
SYSCALL(write)
 5b3:	b8 10 00 00 00       	mov    $0x10,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <close>:
SYSCALL(close)
 5bb:	b8 15 00 00 00       	mov    $0x15,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <kill>:
SYSCALL(kill)
 5c3:	b8 06 00 00 00       	mov    $0x6,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <exec>:
SYSCALL(exec)
 5cb:	b8 07 00 00 00       	mov    $0x7,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <open>:
SYSCALL(open)
 5d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <mknod>:
SYSCALL(mknod)
 5db:	b8 11 00 00 00       	mov    $0x11,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <unlink>:
SYSCALL(unlink)
 5e3:	b8 12 00 00 00       	mov    $0x12,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <fstat>:
SYSCALL(fstat)
 5eb:	b8 08 00 00 00       	mov    $0x8,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <link>:
SYSCALL(link)
 5f3:	b8 13 00 00 00       	mov    $0x13,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <mkdir>:
SYSCALL(mkdir)
 5fb:	b8 14 00 00 00       	mov    $0x14,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <chdir>:
SYSCALL(chdir)
 603:	b8 09 00 00 00       	mov    $0x9,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <dup>:
SYSCALL(dup)
 60b:	b8 0a 00 00 00       	mov    $0xa,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <getpid>:
SYSCALL(getpid)
 613:	b8 0b 00 00 00       	mov    $0xb,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <sbrk>:
SYSCALL(sbrk)
 61b:	b8 0c 00 00 00       	mov    $0xc,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <sleep>:
SYSCALL(sleep)
 623:	b8 0d 00 00 00       	mov    $0xd,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <uptime>:
SYSCALL(uptime)
 62b:	b8 0e 00 00 00       	mov    $0xe,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <walkpt>:
SYSCALL(walkpt)
 633:	b8 16 00 00 00       	mov    $0x16,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    
 63b:	66 90                	xchg   %ax,%ax
 63d:	66 90                	xchg   %ax,%ax
 63f:	90                   	nop

00000640 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 3c             	sub    $0x3c,%esp
 649:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 64c:	89 d1                	mov    %edx,%ecx
{
 64e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 651:	85 d2                	test   %edx,%edx
 653:	0f 89 7f 00 00 00    	jns    6d8 <printint+0x98>
 659:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 65d:	74 79                	je     6d8 <printint+0x98>
    neg = 1;
 65f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 666:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 668:	31 db                	xor    %ebx,%ebx
 66a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 670:	89 c8                	mov    %ecx,%eax
 672:	31 d2                	xor    %edx,%edx
 674:	89 cf                	mov    %ecx,%edi
 676:	f7 75 c4             	divl   -0x3c(%ebp)
 679:	0f b6 92 08 0c 00 00 	movzbl 0xc08(%edx),%edx
 680:	89 45 c0             	mov    %eax,-0x40(%ebp)
 683:	89 d8                	mov    %ebx,%eax
 685:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 688:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 68b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 68e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 691:	76 dd                	jbe    670 <printint+0x30>
  if(neg)
 693:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 696:	85 c9                	test   %ecx,%ecx
 698:	74 0c                	je     6a6 <printint+0x66>
    buf[i++] = '-';
 69a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 69f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6ad:	eb 07                	jmp    6b6 <printint+0x76>
 6af:	90                   	nop
 6b0:	0f b6 13             	movzbl (%ebx),%edx
 6b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6b6:	83 ec 04             	sub    $0x4,%esp
 6b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6bc:	6a 01                	push   $0x1
 6be:	56                   	push   %esi
 6bf:	57                   	push   %edi
 6c0:	e8 ee fe ff ff       	call   5b3 <write>
  while(--i >= 0)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	39 de                	cmp    %ebx,%esi
 6ca:	75 e4                	jne    6b0 <printint+0x70>
    putc(fd, buf[i]);
}
 6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cf:	5b                   	pop    %ebx
 6d0:	5e                   	pop    %esi
 6d1:	5f                   	pop    %edi
 6d2:	5d                   	pop    %ebp
 6d3:	c3                   	ret    
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6df:	eb 87                	jmp    668 <printint+0x28>
 6e1:	eb 0d                	jmp    6f0 <printf>
 6e3:	90                   	nop
 6e4:	90                   	nop
 6e5:	90                   	nop
 6e6:	90                   	nop
 6e7:	90                   	nop
 6e8:	90                   	nop
 6e9:	90                   	nop
 6ea:	90                   	nop
 6eb:	90                   	nop
 6ec:	90                   	nop
 6ed:	90                   	nop
 6ee:	90                   	nop
 6ef:	90                   	nop

000006f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6fc:	0f b6 1e             	movzbl (%esi),%ebx
 6ff:	84 db                	test   %bl,%bl
 701:	0f 84 b8 00 00 00    	je     7bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 707:	8d 45 10             	lea    0x10(%ebp),%eax
 70a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 70d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 710:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 712:	89 45 d0             	mov    %eax,-0x30(%ebp)
 715:	eb 37                	jmp    74e <printf+0x5e>
 717:	89 f6                	mov    %esi,%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 720:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 723:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	74 17                	je     744 <printf+0x54>
  write(fd, &c, 1);
 72d:	83 ec 04             	sub    $0x4,%esp
 730:	88 5d e7             	mov    %bl,-0x19(%ebp)
 733:	6a 01                	push   $0x1
 735:	57                   	push   %edi
 736:	ff 75 08             	pushl  0x8(%ebp)
 739:	e8 75 fe ff ff       	call   5b3 <write>
 73e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 741:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 744:	0f b6 1e             	movzbl (%esi),%ebx
 747:	83 c6 01             	add    $0x1,%esi
 74a:	84 db                	test   %bl,%bl
 74c:	74 71                	je     7bf <printf+0xcf>
    c = fmt[i] & 0xff;
 74e:	0f be cb             	movsbl %bl,%ecx
 751:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 754:	85 d2                	test   %edx,%edx
 756:	74 c8                	je     720 <printf+0x30>
      }
    } else if(state == '%'){
 758:	83 fa 25             	cmp    $0x25,%edx
 75b:	75 e7                	jne    744 <printf+0x54>
      if(c == 'd'){
 75d:	83 f8 64             	cmp    $0x64,%eax
 760:	0f 84 9a 00 00 00    	je     800 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 766:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 76c:	83 f9 70             	cmp    $0x70,%ecx
 76f:	74 5f                	je     7d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 771:	83 f8 73             	cmp    $0x73,%eax
 774:	0f 84 d6 00 00 00    	je     850 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 77a:	83 f8 63             	cmp    $0x63,%eax
 77d:	0f 84 8d 00 00 00    	je     810 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 783:	83 f8 25             	cmp    $0x25,%eax
 786:	0f 84 b4 00 00 00    	je     840 <printf+0x150>
  write(fd, &c, 1);
 78c:	83 ec 04             	sub    $0x4,%esp
 78f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 793:	6a 01                	push   $0x1
 795:	57                   	push   %edi
 796:	ff 75 08             	pushl  0x8(%ebp)
 799:	e8 15 fe ff ff       	call   5b3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 79e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7a1:	83 c4 0c             	add    $0xc,%esp
 7a4:	6a 01                	push   $0x1
 7a6:	83 c6 01             	add    $0x1,%esi
 7a9:	57                   	push   %edi
 7aa:	ff 75 08             	pushl  0x8(%ebp)
 7ad:	e8 01 fe ff ff       	call   5b3 <write>
  for(i = 0; fmt[i]; i++){
 7b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 7b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 7bb:	84 db                	test   %bl,%bl
 7bd:	75 8f                	jne    74e <printf+0x5e>
    }
  }
}
 7bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c2:	5b                   	pop    %ebx
 7c3:	5e                   	pop    %esi
 7c4:	5f                   	pop    %edi
 7c5:	5d                   	pop    %ebp
 7c6:	c3                   	ret    
 7c7:	89 f6                	mov    %esi,%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d8:	6a 00                	push   $0x0
 7da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	8b 13                	mov    (%ebx),%edx
 7e2:	e8 59 fe ff ff       	call   640 <printint>
        ap++;
 7e7:	89 d8                	mov    %ebx,%eax
 7e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ec:	31 d2                	xor    %edx,%edx
        ap++;
 7ee:	83 c0 04             	add    $0x4,%eax
 7f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7f4:	e9 4b ff ff ff       	jmp    744 <printf+0x54>
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	b9 0a 00 00 00       	mov    $0xa,%ecx
 808:	6a 01                	push   $0x1
 80a:	eb ce                	jmp    7da <printf+0xea>
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 810:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 816:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 818:	6a 01                	push   $0x1
        ap++;
 81a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 81d:	57                   	push   %edi
 81e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 821:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 824:	e8 8a fd ff ff       	call   5b3 <write>
        ap++;
 829:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 82c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82f:	31 d2                	xor    %edx,%edx
 831:	e9 0e ff ff ff       	jmp    744 <printf+0x54>
 836:	8d 76 00             	lea    0x0(%esi),%esi
 839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 840:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 843:	83 ec 04             	sub    $0x4,%esp
 846:	e9 59 ff ff ff       	jmp    7a4 <printf+0xb4>
 84b:	90                   	nop
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 850:	8b 45 d0             	mov    -0x30(%ebp),%eax
 853:	8b 18                	mov    (%eax),%ebx
        ap++;
 855:	83 c0 04             	add    $0x4,%eax
 858:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 85b:	85 db                	test   %ebx,%ebx
 85d:	74 17                	je     876 <printf+0x186>
        while(*s != 0){
 85f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 862:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 864:	84 c0                	test   %al,%al
 866:	0f 84 d8 fe ff ff    	je     744 <printf+0x54>
 86c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 86f:	89 de                	mov    %ebx,%esi
 871:	8b 5d 08             	mov    0x8(%ebp),%ebx
 874:	eb 1a                	jmp    890 <printf+0x1a0>
          s = "(null)";
 876:	bb fe 0b 00 00       	mov    $0xbfe,%ebx
        while(*s != 0){
 87b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 87e:	b8 28 00 00 00       	mov    $0x28,%eax
 883:	89 de                	mov    %ebx,%esi
 885:	8b 5d 08             	mov    0x8(%ebp),%ebx
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
          s++;
 893:	83 c6 01             	add    $0x1,%esi
 896:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 899:	6a 01                	push   $0x1
 89b:	57                   	push   %edi
 89c:	53                   	push   %ebx
 89d:	e8 11 fd ff ff       	call   5b3 <write>
        while(*s != 0){
 8a2:	0f b6 06             	movzbl (%esi),%eax
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	84 c0                	test   %al,%al
 8aa:	75 e4                	jne    890 <printf+0x1a0>
 8ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 8af:	31 d2                	xor    %edx,%edx
 8b1:	e9 8e fe ff ff       	jmp    744 <printf+0x54>
 8b6:	66 90                	xchg   %ax,%ax
 8b8:	66 90                	xchg   %ax,%ax
 8ba:	66 90                	xchg   %ax,%ax
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	53                   	push   %ebx
 8c4:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 8c7:	68 19 0c 00 00       	push   $0xc19
 8cc:	6a 01                	push   $0x1
 8ce:	e8 1d fe ff ff       	call   6f0 <printf>
  if(freep == 0){ 
 8d3:	a1 e0 0f 00 00       	mov    0xfe0,%eax
 8d8:	83 c4 10             	add    $0x10,%esp
 8db:	85 c0                	test   %eax,%eax
 8dd:	74 30                	je     90f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 8df:	8b 1d e4 0f 00 00    	mov    0xfe4,%ebx
 8e5:	81 fb e4 0f 00 00    	cmp    $0xfe4,%ebx
 8eb:	74 22                	je     90f <print_free_list+0x4f>
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 8f0:	83 ec 04             	sub    $0x4,%esp
 8f3:	ff 73 04             	pushl  0x4(%ebx)
 8f6:	68 2a 0c 00 00       	push   $0xc2a
 8fb:	6a 01                	push   $0x1
 8fd:	e8 ee fd ff ff       	call   6f0 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 902:	8b 1b                	mov    (%ebx),%ebx
 904:	83 c4 10             	add    $0x10,%esp
 907:	81 fb e4 0f 00 00    	cmp    $0xfe4,%ebx
 90d:	75 e1                	jne    8f0 <print_free_list+0x30>
    printf(1, "NULL\n");
 90f:	83 ec 08             	sub    $0x8,%esp
 912:	68 24 0c 00 00       	push   $0xc24
 917:	6a 01                	push   $0x1
 919:	e8 d2 fd ff ff       	call   6f0 <printf>
  }
  printf(1, "NULL\n");
}
 91e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 921:	c9                   	leave  
 922:	c3                   	ret    
 923:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000930 <free>:

void
free(void *ap)
{
 930:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 931:	a1 e0 0f 00 00       	mov    0xfe0,%eax
{
 936:	89 e5                	mov    %esp,%ebp
 938:	57                   	push   %edi
 939:	56                   	push   %esi
 93a:	53                   	push   %ebx
 93b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 93e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 940:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 943:	39 c8                	cmp    %ecx,%eax
 945:	73 19                	jae    960 <free+0x30>
 947:	89 f6                	mov    %esi,%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 950:	39 d1                	cmp    %edx,%ecx
 952:	72 14                	jb     968 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 954:	39 d0                	cmp    %edx,%eax
 956:	73 10                	jae    968 <free+0x38>
{
 958:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95a:	8b 10                	mov    (%eax),%edx
 95c:	39 c8                	cmp    %ecx,%eax
 95e:	72 f0                	jb     950 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 960:	39 d0                	cmp    %edx,%eax
 962:	72 f4                	jb     958 <free+0x28>
 964:	39 d1                	cmp    %edx,%ecx
 966:	73 f0                	jae    958 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 968:	8b 73 fc             	mov    -0x4(%ebx),%esi
 96b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 96e:	39 fa                	cmp    %edi,%edx
 970:	74 1e                	je     990 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 972:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 975:	8b 50 04             	mov    0x4(%eax),%edx
 978:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 97b:	39 f1                	cmp    %esi,%ecx
 97d:	74 28                	je     9a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 97f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 981:	5b                   	pop    %ebx
  freep = p;
 982:	a3 e0 0f 00 00       	mov    %eax,0xfe0
}
 987:	5e                   	pop    %esi
 988:	5f                   	pop    %edi
 989:	5d                   	pop    %ebp
 98a:	c3                   	ret    
 98b:	90                   	nop
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 990:	03 72 04             	add    0x4(%edx),%esi
 993:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 996:	8b 10                	mov    (%eax),%edx
 998:	8b 12                	mov    (%edx),%edx
 99a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 99d:	8b 50 04             	mov    0x4(%eax),%edx
 9a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9a3:	39 f1                	cmp    %esi,%ecx
 9a5:	75 d8                	jne    97f <free+0x4f>
    p->s.size += bp->s.size;
 9a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9aa:	a3 e0 0f 00 00       	mov    %eax,0xfe0
    p->s.size += bp->s.size;
 9af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9b5:	89 10                	mov    %edx,(%eax)
}
 9b7:	5b                   	pop    %ebx
 9b8:	5e                   	pop    %esi
 9b9:	5f                   	pop    %edi
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret    
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <morecore>:

static Header*
morecore(uint nu)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	53                   	push   %ebx
 9c4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9c9:	83 ec 10             	sub    $0x10,%esp
 9cc:	3d 00 10 00 00       	cmp    $0x1000,%eax
 9d1:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 9d4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9db:	50                   	push   %eax
 9dc:	e8 3a fc ff ff       	call   61b <sbrk>
  if(p == (char*)-1)
 9e1:	83 c4 10             	add    $0x10,%esp
 9e4:	83 f8 ff             	cmp    $0xffffffff,%eax
 9e7:	74 1f                	je     a08 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9e9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ec:	83 ec 0c             	sub    $0xc,%esp
 9ef:	83 c0 08             	add    $0x8,%eax
 9f2:	50                   	push   %eax
 9f3:	e8 38 ff ff ff       	call   930 <free>
  return freep;
 9f8:	a1 e0 0f 00 00       	mov    0xfe0,%eax
}
 9fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 a00:	83 c4 10             	add    $0x10,%esp
}
 a03:	c9                   	leave  
 a04:	c3                   	ret    
 a05:	8d 76 00             	lea    0x0(%esi),%esi
 a08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 a0b:	31 c0                	xor    %eax,%eax
}
 a0d:	c9                   	leave  
 a0e:	c3                   	ret    
 a0f:	90                   	nop

00000a10 <malloc>:

void*
malloc(uint nbytes)
{
 a10:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a11:	8b 0d e0 0f 00 00    	mov    0xfe0,%ecx
{
 a17:	89 e5                	mov    %esp,%ebp
 a19:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 a1d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1e:	8d 58 07             	lea    0x7(%eax),%ebx
 a21:	c1 eb 03             	shr    $0x3,%ebx
 a24:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a27:	85 c9                	test   %ecx,%ecx
 a29:	74 65                	je     a90 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a2b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 a2d:	8b 50 04             	mov    0x4(%eax),%edx
 a30:	39 d3                	cmp    %edx,%ebx
 a32:	77 1d                	ja     a51 <malloc+0x41>
 a34:	eb 2e                	jmp    a64 <malloc+0x54>
 a36:	8d 76 00             	lea    0x0(%esi),%esi
 a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a40:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 a42:	8b 56 04             	mov    0x4(%esi),%edx
 a45:	39 da                	cmp    %ebx,%edx
 a47:	73 27                	jae    a70 <malloc+0x60>
 a49:	8b 0d e0 0f 00 00    	mov    0xfe0,%ecx
 a4f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a51:	39 c1                	cmp    %eax,%ecx
 a53:	75 eb                	jne    a40 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 a55:	89 d8                	mov    %ebx,%eax
 a57:	e8 64 ff ff ff       	call   9c0 <morecore>
 a5c:	85 c0                	test   %eax,%eax
 a5e:	75 e0                	jne    a40 <malloc+0x30>
        return 0;
  }
}
 a60:	5b                   	pop    %ebx
 a61:	5e                   	pop    %esi
 a62:	5d                   	pop    %ebp
 a63:	c3                   	ret    
    if(p->s.size >= nunits){
 a64:	89 c6                	mov    %eax,%esi
 a66:	89 c8                	mov    %ecx,%eax
 a68:	90                   	nop
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 a70:	39 d3                	cmp    %edx,%ebx
 a72:	74 4c                	je     ac0 <malloc+0xb0>
        p->s.size -= nunits;
 a74:	29 da                	sub    %ebx,%edx
 a76:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 a79:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 a7c:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 a7f:	5b                   	pop    %ebx
      freep = prevp;
 a80:	a3 e0 0f 00 00       	mov    %eax,0xfe0
      return (void*)(p + 1);
 a85:	8d 46 08             	lea    0x8(%esi),%eax
}
 a88:	5e                   	pop    %esi
 a89:	5d                   	pop    %ebp
 a8a:	c3                   	ret    
 a8b:	90                   	nop
 a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a90:	c7 05 e0 0f 00 00 e4 	movl   $0xfe4,0xfe0
 a97:	0f 00 00 
    base.s.size = 0;
 a9a:	b9 e4 0f 00 00       	mov    $0xfe4,%ecx
    base.s.ptr = freep = prevp = &base;
 a9f:	c7 05 e4 0f 00 00 e4 	movl   $0xfe4,0xfe4
 aa6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa9:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 aab:	c7 05 e8 0f 00 00 00 	movl   $0x0,0xfe8
 ab2:	00 00 00 
    if(p->s.size >= nunits){
 ab5:	eb 9a                	jmp    a51 <malloc+0x41>
 ab7:	89 f6                	mov    %esi,%esi
 ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 ac0:	8b 16                	mov    (%esi),%edx
 ac2:	89 10                	mov    %edx,(%eax)
 ac4:	eb b9                	jmp    a7f <malloc+0x6f>
 ac6:	8d 76 00             	lea    0x0(%esi),%esi
 ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ad0 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	57                   	push   %edi
 ad4:	56                   	push   %esi
 ad5:	53                   	push   %ebx
 ad6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ad9:	8b 45 08             	mov    0x8(%ebp),%eax
 adc:	83 c0 07             	add    $0x7,%eax
 adf:	c1 e8 03             	shr    $0x3,%eax
 ae2:	83 c0 01             	add    $0x1,%eax
 ae5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 ae8:	90                   	nop
 ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 af0:	8b 1d e0 0f 00 00    	mov    0xfe0,%ebx
 af6:	85 db                	test   %ebx,%ebx
 af8:	74 66                	je     b60 <malloc_wf+0x90>
 afa:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 afc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 b03:	89 df                	mov    %ebx,%edi
  uint max = 0;
 b05:	31 f6                	xor    %esi,%esi
  maxp = 0;
 b07:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 b0e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b11:	eb 12                	jmp    b25 <malloc_wf+0x55>
 b13:	90                   	nop
 b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 b18:	39 d8                	cmp    %ebx,%eax
 b1a:	74 24                	je     b40 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b1c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 b1e:	89 c7                	mov    %eax,%edi
 b20:	8b 51 04             	mov    0x4(%ecx),%edx
 b23:	89 c8                	mov    %ecx,%eax
 b25:	39 d6                	cmp    %edx,%esi
 b27:	73 ef                	jae    b18 <malloc_wf+0x48>
 b29:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 b2c:	77 ea                	ja     b18 <malloc_wf+0x48>
    if(p == freep)
 b2e:	39 d8                	cmp    %ebx,%eax
 b30:	74 57                	je     b89 <malloc_wf+0xb9>
 b32:	89 7d dc             	mov    %edi,-0x24(%ebp)
 b35:	89 d6                	mov    %edx,%esi
 b37:	89 45 e0             	mov    %eax,-0x20(%ebp)
 b3a:	eb e0                	jmp    b1c <malloc_wf+0x4c>
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 b40:	8b 45 e0             	mov    -0x20(%ebp),%eax
 b43:	85 c0                	test   %eax,%eax
 b45:	75 39                	jne    b80 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 b47:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b4a:	e8 71 fe ff ff       	call   9c0 <morecore>
 b4f:	85 c0                	test   %eax,%eax
 b51:	75 9d                	jne    af0 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 b53:	83 c4 1c             	add    $0x1c,%esp
 b56:	5b                   	pop    %ebx
 b57:	5e                   	pop    %esi
 b58:	5f                   	pop    %edi
 b59:	5d                   	pop    %ebp
 b5a:	c3                   	ret    
 b5b:	90                   	nop
 b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 b60:	c7 05 e0 0f 00 00 e4 	movl   $0xfe4,0xfe0
 b67:	0f 00 00 
 b6a:	c7 05 e4 0f 00 00 e4 	movl   $0xfe4,0xfe4
 b71:	0f 00 00 
    base.s.size = 0;
 b74:	c7 05 e8 0f 00 00 00 	movl   $0x0,0xfe8
 b7b:	00 00 00 
  if(maxp != 0){
 b7e:	eb c7                	jmp    b47 <malloc_wf+0x77>
 b80:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 b83:	8b 7d dc             	mov    -0x24(%ebp),%edi
 b86:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 b89:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 b8c:	74 1f                	je     bad <malloc_wf+0xdd>
      p->s.size -= nunits;
 b8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b91:	29 c2                	sub    %eax,%edx
 b93:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 b96:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 b99:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 b9c:	89 3d e0 0f 00 00    	mov    %edi,0xfe0
 ba2:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 ba5:	8d 43 08             	lea    0x8(%ebx),%eax
 ba8:	5b                   	pop    %ebx
 ba9:	5e                   	pop    %esi
 baa:	5f                   	pop    %edi
 bab:	5d                   	pop    %ebp
 bac:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 bad:	8b 03                	mov    (%ebx),%eax
 baf:	89 07                	mov    %eax,(%edi)
 bb1:	eb e9                	jmp    b9c <malloc_wf+0xcc>
