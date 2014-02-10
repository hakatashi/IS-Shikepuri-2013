# �J���g�[���W���̃v���O�����̏Ă������ł��B

load("./make2d.rb")

def siercarpet(n)
  a = make2d(3**n, 3**n)
  subsiercarpet(a, n, 0, 0)
  show(a)
end

# a �Ƃ����z��� (x, y) ��������Ƃ��� n ���̃V�F���s���X�L�[�̃J�[�y�b�g�𐶐�����֐�
def subsiercarpet(a, n, x, y)
  # 0���Ȃ�P���Ɉ�h��Ԃ�����
  if n == 0
    a[x][y] = 1
  else # 0���łȂ��Ȃ�A���������̎����̃T�u�J�[�y�b�g���Ăяo��
    # 3x3�̃T�u�J�[�y�b�g���K�v�Ȃ̂ŁAx������y�����ɂ��̉񐔂��������[�v������
    for carpX in 0..2 do
      for carpY in 0..2 do
        # �܂�Ȃ��̈������
        if carpX != 1 || carpY != 1
          # �T�u�J�[�y�b�g���A�[�I�ɌĂяo���܂��B
          # ������̌v�Z������������Ƃ�₱������������܂���B
          # �Ȃ��Aruby�ł͏�Z(*)���p��(**)���D�悳��܂��B
          subsiercarpet(a, n - 1, x + carpX * 3 ** (n-1), y + carpY * 3 ** (n-1))
        end
      end
    end
  end
end

