
$(document).ready(function () {
	//로그인 버튼 클릭
	$("#loginBtn").click(function(){
		$("#modalLogin").modal();
	});
	
    // 비밀번호변경 모달창 호출
    $('#recovery-password').on('click', () => {
        ajaxAlert('가입하신 이메일을 입력하세요.', '/dopaming/find_pw/', '이메일이 전송되었습니다.', '이메일이 올바르지 않습니다.');
    });
    
    // SweetAlert Ajax
    const ajaxAlert = (title, url, successText, errorText) => {
        Swal.fire({
            title: title,
            input: 'text',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            cancelButtonText: '취소',
            confirmButtonText: '발송',
            showLoaderOnConfirm: true,
            preConfirm: (data) => {
                return fetch(`${url}${data}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                    }
                })
                    .then(response => {
                        if (response.status == 500) {
                            throw new Error(response.statusText);
                        }
                        return response;
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                            `오류 발생: ${errorText}.`
                        )
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((data) => {
            if (data.dismiss == 'cancel' || data.dismiss == 'backdrop') {
                return false;
            }
            Swal.closeModal();
            setTimeout(() => {
                successAlert(successText);
            }, 300);
        })
    }
    
    // SweetAlert Success
    const successAlert = (text) => {
        Swal.fire({
            type: 'success',
            title: text,
            showConfirmButton: false,
            allowOutsideClick: false,
            timer: 2000
        });
    }
});