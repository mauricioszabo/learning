import com.badlogic.gdx._
import com.badlogic.gdx.graphics._
import com.badlogic.gdx.graphics.g2d._
import com.badlogic.gdx.input._

class NewSprite(app: {def height: Int}) extends SpriteBatch {
    def draw(texture: Texture, x:Int , y:Int) = {
        val h = texture.getHeight()
        super.draw(texture, x, app.height - h - y, 0, 0, texture.getWidth(), h)
    }
}

class Principal extends InputAdapter with ApplicationListener {
    private lazy val spriteBatch = new NewSprite(this)
    private lazy val tabuleiro = new Texture(Gdx.files.internal("data/Tabuleiro.png"))
    private lazy val peca = new Texture(Gdx.files.internal("data/Bloco.png"))
    private val board = new Board()
    var width=0
    var height=0

    override def create() {
        Gdx.input.setInputProcessor(this);
    }

    override def render() {
        val x=0
        val y=19
        Gdx.graphics.getGL10().glClear(GL10.GL_COLOR_BUFFER_BIT)
        spriteBatch begin()
        spriteBatch draw(tabuleiro, 0, 0)
        spriteBatch draw(peca, x*30+258, y*30+3, 0, 0, peca.getWidth(), peca.getHeight())
        //spriteBatch draw(peca, 0, 604 - peca.getWidth(), 0, 0, peca.getWidth(), peca.getHeight())
        spriteBatch draw(peca, 0, 20)
        spriteBatch end()
    }

    override def resize(width: Int, height: Int) {
        //println("Resizing")
        //println(spriteBatch.getProjectionMatrix())
        this.width = width
        this.height = height
        spriteBatch.getProjectionMatrix().setToOrtho2D(0, 0, width, height)
    }

    override def keyDown(key: Int) = {
        println(Input.Keys.KEYCODE_DPAD_LEFT == key)
        true
    }

    override def pause() = null
    override def resume() = null
    override def dispose() = null

}

